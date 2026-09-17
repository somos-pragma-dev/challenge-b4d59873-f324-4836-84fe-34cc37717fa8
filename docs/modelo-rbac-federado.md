# Diseño del Modelo de RBAC Federado para Multi-Cluster Kubernetes

## Visión General

En un entorno Kubernetes con 12 clusters distribuidos en 4 regiones, la gestión de permisos se vuelve compleja. Un modelo de RBAC federado permite mantener políticas de seguridad consistentes mientras se respeta la autonomía operativa de cada equipo y región. Este documento describe el diseño adoptado y su justificación.

## Principios de Diseño

### Separación de Responsabilidades

El modelo se fundamenta en el principio de mínimo privilegio: cada identity (usuario, servicio, proceso) recibe únicamente los permisos necesarios para realizar sus funciones específicas. No se otorgan permisos adicionales "por si acaso" ni se utilizan roles administrativos como默认值.

### Jerarquía de Permisos

Se establece una jerarquía clara entre permisos globales y namespace-scoped. Los ClusterRole y ClusterRoleBinding definen políticas que aplican a todos los clusters, mientras que Role y RoleBinding manejan permisos específicos por namespace.

### Modelo Federado

El término "federado" implica que existe una autoridad central que define políticas base, pero los equipos locales pueden extender o especializar estas políticas dentro de sus dominios. Esto permite mantener consistencia global mientras se respeta la diversidad operativa de cada región.

## Estructura de Roles

### Roles Globales del Sistema

Estos roles son administered por el equipo de plataforma y aplican a todos los clusters del federado.

**cluster-admin:**
- Acceso completo a todos los recursos en todos los namespaces
- Reservado exclusivamente para break-glass scenarios
- Auditado y monitorizado en tiempo real
- Credenciales rotadas cada 90 días con almacenamiento en Vault

**platform-admin:**
- Gestión de clusters y componentes de infraestructura
- Creación y modificación de namespaces
- Gestión de CRDs del ecosistema (ArgoCD, Crossplane, etc.)
- No tiene acceso a datos de aplicaciones

**security-admin:**
- Gestión de políticas de red y RBAC
- Auditoría de accesos y configuraciones
- Gestión de Vault y external-secrets
- Acceso de lectura a todos los namespaces para auditoría

**platform-viewer:**
- Acceso de lectura a recursos de infraestructura
- Visualización en ArgoCD UI
- No puede modificar ningún recurso

### Roles por Equipo de Aplicación

Cada equipo de servicio recibe roles específicos para gestionar sus aplicaciones.

**app-team-admin:**
- Control total sobre los namespaces asignados al equipo
- Gestión de deployments, services, configmaps
- Creación de recursos específicos de la aplicación
- No puede modificar recursos de otros equipos

**appteam-developer:**
- Desarrollo y despliegue en namespaces asignados
- Lectura y escritura en recursos de aplicación
- No puede modificar RBAC ni recursos de infraestructura

**appteam-readonly:**
- Acceso de solo lectura a los namespaces del equipo
- Uso de herramientas de monitoreo y debugging
- No puede realizar cambios

### Roles de Automatización

Los sistemas automatizados requieren identidades específicas con permisos controlados.

**argocd-manager:**
- Permisos para crear, actualizar y eliminar recursos de aplicación
- Acceso a todos los namespaces donde se despliegan aplicaciones
-绑定 a la service account de ArgoCD en cada cluster

**crossplane-provider:**
- Permisos para gestionar recursos de infraestructura
- Creación de AWS resources (VPC, RDS, S3, etc.)
-绑定 al ServiceAccount del Crossplane Provider

**failover-controller:**
- Permisos para modificar Service y Ingress durante failover
- Lectura de recursos de salud de aplicaciones
- Gestión de políticas de red durante transición

**backup-controller:**
- Permisos de lectura en todos los namespaces
- Permisos de escritura en recursos de backup (VolumeSnapshots)
- No puede modificar aplicaciones en ejecución

## Modelo de Federation

### Sincronización de Políticas

Las políticas RBAC se definen en un repositorio Git central y se distribuyen a todos los clusters mediante ArgoCD. Esto garantiza que todos los clusters tengan la misma configuración de seguridad y permite auditoría de cambios a través de Git history.

### Namespace por Equipo

Cada equipo de aplicación recibe uno o más namespaces dedicados. Los nombres siguen la convención: `{environment}-{team-name}-{service-name}`. Por ejemplo: `prod-payments-api`, `staging-fraud-detection`.

### Network Policies

Las políticas de red complementan el RBAC para restringir comunicación entre servicios. Se implementan políticas que permiten comunicación solo entre servicios del mismo equipo y dependencias explícitamente definidas.

## Implementación Técnica

### ClusterRoleBindings para Acceso Federado

Los ClusterRoleBinding se utilizan para permisos que deben aplicar en múltiples namespaces o que requieren acceso cluster-wide.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: platform-team-cluster-admin
  annotations:
    description: "Permisos administrativos para el equipo de plataforma"
    managed-by: "argocd"
subjects:
- kind: Group
  name: platform-team
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: platform-admin
  apiGroup: rbac.authorization.k8s.io
```

### RoleBindings por Namespace

Los RoleBinding scoped a namespace permiten granularidad dentro de cada cluster.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: payments-team-developer
  namespace: prod-payments-api
  annotations:
    description: "Permisos de desarrollo para el equipo de pagos"
subjects:
- kind: Group
  name: payments-team
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: appteam-developer
  apiGroup: rbac.authorization.k8s.io
```

### Integración con Identity Provider

La autenticación se realiza mediante OIDC integrado con el proveedor de identidad corporativo (Okta, Azure AD, Keycloak). Los grupos del IdP se mapean a los grupos de Kubernetes mediante el flag --oidc-groups-claim del API server.

## Justificación de Seguridad

### Por qué RBAC Federado

**1. Consistencia:** Todas las políticas de seguridad se definen una vez y se aplican a todos los clusters. No existe el riesgo de configuraciones divergentes que creen vulnerabilidades.

**2. Auditoría centralizada:** Almacenar las políticas en Git permite auditoría completa de quién cambió qué permisos y cuándo. El cambio de permisos es un evento que requiere revisión y approval.

**3. Cumplimiento regulatorio:** Los reguladores financieros exigen control de acceso basado en roles y auditoría de accesos. El modelo federado facilita demostrar compliance.

**4. Recuperación ante desastres:** En caso de pérdidade un cluster, las políticas se restauran automáticamente desde Git, garantizando que el cluster recuperado tenga la misma configuración de seguridad.

**5. Escalabilidad:** Agregar nuevos clusters no requiere replicar manualmente la configuración de seguridad. El nuevo cluster sincroniza automáticamente las políticas existentes.

### Gestión de Credenciales

Todas las credenciales de servicio se almacenan en Vault y se injectan mediante external-secrets. Las service accounts utilizan JWT tokens que rotan automáticamente. Los tokens de usuario se configuran con tiempo de expiración apropiado según el nivel de acceso.

### Monitoreo y Alertas

Se configuran alertas para:
- Intentos de acceso denegado a recursos sensibles
- Cambios en ClusterRoleBindings
- Uso de credenciales administrativas
- Acceso desde ubicaciones no reconocidas
- Fallos de autenticación repetidos

## Matriz de Permisos por Rol

| Recurso | Platform Admin | Security Admin | App Team Admin | Developer | Readonly |
|---------|----------------|----------------|----------------|-----------|----------|
| Namespaces | CRUD | R | CRUD (own) | R | R |
| Deployments | CRUD | R | CRUD (own) | CRUD (own) | R |
| Services | CRUD | R | CRUD (own) | CRUD (own) | R |
| ConfigMaps | CRUD | R | CRUD (own) | CRUD (own) | R |
| Secrets | R | CRUD | CRUD (own) | R | R |
| RBAC | CRUD | CRUD | R (own) | R | R |
| CRDs | CRUD | R | R | R | R |
| Nodes | R | R | - | - | R |
| PVs | CRUD | R | - | - | R |

## Conclusión

El modelo de RBAC federado proporciona el nivel de control y flexibilidad necesario para gestionar 12 clusters en 4 regiones. La combinación de ClusterRole para permisos globales y Role para permisos namespace-scoped, junto con la sincronización via ArgoCD, garantiza consistencia, seguridad y auditabilidad en todo el entorno fintech.