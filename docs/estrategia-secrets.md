# Estrategia de Gestión de Secrets con Vault y external-secrets

## Visión General

Este documento describe la estrategia de gestión de secrets implementada en el control plane multi-cluster de Fintech. La solución combina HashiCorp Vault como almacenamiento centralizado de secretos y external-secrets como operador de Kubernetes para la sincronización automática de secrets hacia los clusters.

## Arquitectura de Componentes

### Vault como Central Store

El cluster primario ejecuta una instancia de Vault en modo HA con almacenamiento en etcd. Esta configuración garantiza persistencia y disponibilidad:
- Vault opera en el namespace `vault` del cluster primario
- El almacenamiento backend utiliza etcd con TLS mutuo
- La autenticación se realiza mediante Kubernetes Service Account
- Los secretos se organizan por ambiente y aplicación

### external-secrets Operator

El operador external-secrets se despliega en todos los clusters (primario y standby). Su función es:
- Sincronizar secretos desde Vault hacia Kubernetes Secrets
- Detectar cambios en Vault y actualizar automáticamente
- Soportar múltiples SecretStores para diferentes fuentes
- Gestionar la rotación de credenciales

## Configuración de SecretStore

La configuración de SecretStore en cada cluster establece la conexión con Vault:

```yaml
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: vault-backend
spec:
  provider:
    vault:
      server: "https://vault.vault.svc.cluster.local:8200"
      pathPrefix: "/v1"
      version: "v2"
      auth:
        kubernetes:
          mountPath: "kubernetes"
          role: "fintech-external-secrets"
```

## Modelo de Secretos por Ambiente

La estructura de secrets sigue una jerarquía por ambiente:
- `secret/data/fintech/dev/*` - Ambiente de desarrollo
- `secret/data/fintech/staging/*` - Ambiente de staging
- `secret/data/fintech/prod/*` - Ambiente de producción

Cada namespace en los clusters recibe los secretos correspondientes mediante ExternalSecret resources que referencian el path correcto en Vault.

## Sincronización y Rotación

El operador external-secrets verifica cambios en Vault cada 60 segundos por defecto. Para secretos críticos, el intervalo se reduce a 15 segundos. La rotación automática elimina la necesidad de reiniciar pods manualmente.

## Consideraciones de Seguridad

- Los tokens de Service Account tienen TTL de 24 horas
- Vault requiere autenticación mutua TLS
- Los secretos nunca se almacenan en Git
- Las políticas de Vault limitan acceso por namespace
- Auditoría completa de accesos en Vault

## Referencias

- Documentación oficial de external-secrets: https://external-secrets.io/
- HashiCorp Vault Kubernetes Auth: https://www.vaultproject.io/docs/auth/kubernetes
- Mejores prácticas de gestión de secretos en Kubernetes: https://kubernetes.io/docs/concepts/configuration/secret/