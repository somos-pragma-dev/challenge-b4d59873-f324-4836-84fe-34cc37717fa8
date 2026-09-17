# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Archivos corruptos — arreglar primero

El contenido no corresponde a la extension. Regeneralos completos:

- `package.json` — El contenido no corresponde a un archivo json. Hay que regenerarlo completo.
- `aws/iam-policy.json` — El contenido no corresponde a un archivo json. Hay que regenerarlo completo.

### Boilerplate del stack que falta

Sin esto no compila ni arranca. Es andamiaje, no toca nada de lo pedagogico:

- **Punto de entrada del stack elegido** — Sin un punto de entrada reconocible, el runtime no tiene por donde arrancar la aplicacion.
- **Capa de interfaz (controller/handler)** — Sin una capa de interfaz explicita, no hay forma de invocar la logica de negocio desde afuera del proceso.

## Como saber que terminaste

```bash
el comando de build o arranque canonico del stack elegido
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Contexto técnico original
Arquitectura master-l2 de un control plane que gestiona 12 clusters Kubernetes distribuidos en 4 regiones AWS. Usa ArgoCD para GitOps con sync policies por entorno, Crossplane para provisionar infraestructura declarativa (RDS, S3, IAM roles) desde el repo de Git, y una lógica custom de failover que promueve un cluster standby cuando el primary de una región falla su health check por 3 minutos consecutivos. El developer master-l2 debe diseñar la topología de replicación de estado entre clusters, justificar la elección de ArgoCD vs Flux vs Rancher Fleet, el modelo de RBAC federado, la estrategia de secrets con Vault + external-secrets, y la coreografía del disaster recovery incluyendo cómo evita el split-brain durante failovers.

### Reto
- Tema: control plane multi-cluster kubernetes con GitOps y disaster recovery cross-region
- Seniority: master-l2
- Tipo: theoretical
- Título: Diseño de control plane multi-cluster en Kubernetes con GitOps y DR
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Topología de replicación de estado — objetivo: Definir cómo se replicará el estado entre clusters para mantener consistencia y alta disponibilidad. — entregable (NO resolver): Documento que describe la topología de replicación de estado elegida y su justificación.
- Fase 2: Elección de herramientas de GitOps — objetivo: Justificar la elección de ArgoCD sobre Flux y Rancher Fleet para el flujo de trabajo de GitOps. — entregable (NO resolver): Documento que compara las herramientas de GitOps y justifica la elección de ArgoCD.
- Fase 3: Modelo de RBAC federado — objetivo: Diseñar un modelo de RBAC que permita la gestión centralizada de permisos en un entorno multi-cluster. — entregable (NO resolver): Documento que describe el modelo de RBAC federado y su justificación.
- Fase 4: Estrategia de secrets con Vault + external-secrets — objetivo: Diseñar una estrategia para la gestión de secrets en un entorno multi-cluster utilizando Vault y external-secrets. — entregable (NO resolver): Documento que describe la estrategia de gestión de secrets y su justificación.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: package.json ===
{
  "name": "fintech-multi-cluster-control-plane",
  "version": "1.0.0",
  "description": "Control plane multi-cluster Kubernetes con GitOps, Crossplane y Disaster Recovery",
  "main": "index.js",
  "scripts": {
    "validate:k8s": "kubectl apply --dry-run=client -f manifests/",
    "validate:argocd": "argocd app validate manifests/argocd/application.yaml",
    "sync:dev": "argocd app sync fintech-app --server argocd.dev.fintech.internal --auth-token $ARGOCD_TOKEN",
    "sync:staging": "argocd app sync fintech-app --server argocd.staging.fintech.internal --auth-token $ARGOCD_TOKEN",
    "sync:prod": "argocd app sync fintech-app --server argocd.prod.fintech.internal --auth-token $ARGOCD_TOKEN",
    "sync:all": "npm run sync:dev && npm run sync:staging && npm run sync:prod",
    "diff:dev": "argocd app diff fintech-app --server argocd.dev.fintech.internal",
    "diff:staging": "argocd app diff fintech-app --server argocd.staging.fintech.internal",
    "diff:prod": "argocd app diff fintech-app --server argocd.prod.fintech.internal",
    "health:check": "kubectl get applications -A -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.health.status}{"\n"}{end}'",
    "failover:primary": "kubectl apply -f manifests/disaster-recovery/failover-controller.yaml -n disaster-recovery",
    "failover:rollback": "kubectl delete -f manifests/disaster-recovery/failover-controller.yaml -n disaster-recovery",
    "vault:init": "vault operator init -key-shares=5 -key-threshold=3",
    "vault:unseal": "vault operator unseal",
    "crossplane:provision": "kubectl apply -f manifests/crossplane/compositions.yaml",
    "crossplane:providers": "kubectl apply -f manifests/crossplane/providers.yaml",
    "secrets:sync": "kubectl get secretstore -A -o json | jq -r '.items[] | select(.status.conditions[0].status==\"True\") | .metadata.name' | xargs -I {} kubectl apply -f manifests/external-secrets/secret-store.yaml -n external-secrets",
    "rbac:apply": "kubectl apply -f manifests/rbac/cluster-role.yaml && kubectl apply -f manifests/rbac/role-binding.yaml",
    "clusters:list": "kubectl get clusters -A -o wide",
    "clusters:status": "kubectl get kubeadmconfig -A -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.conditions[?(@.type==\"Ready\")].status}{"\n"}{end}'",
    "etcd:backup": "etcdctl snapshot save /backups/etcd-$(date +%Y%m%d-%H%M%S).db --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key",
    "etcd:restore": "etcdctl snapshot restore /backups/etcd-latest.db --data-dir=/var/lib/etcd",
    "test:argocd-sync": "kubectl apply -f tests/argocd-sync-test.yaml",
    "test:crossplane": "kubectl apply -f tests/crossplane-provisioning-test.yaml",
    "test:vault-secrets": "kubectl apply -f tests/vault-secrets-test.yaml",
    "docs:generate": "npm run docs:topologia && npm run docs:gitops && npm run docs:rbac && npm run docs:secrets && npm run docs:dr",
    "docs:topologia": "echo '# Topologia de Replicacion de Estado' > docs/topologia-replicacion-estado.md",
    "docs:gitops": "echo '# Comparativa GitOps' > docs/comparativa-gitops-herramientas.md",
    "docs:rbac": "echo '# Modelo RBAC Federado' > docs/modelo-rbac-federado.md",
    "docs:secrets": "echo '# Estrategia de Secrets' > docs/estrategia-secrets.md",
    "docs:dr": "echo '# Coreografia Disaster Recovery' > docs/coreografia-disaster-recovery.md",
    "aws:iam-validate": "aws iam get-policy --policy-arn arn:aws:iam::$(aws sts get-caller-identity --query 'Account' --output text):policy/FintechMultiClusterPolicy",
    "aws:health-check": "kubectl apply -f aws/health-check-listener.yaml",
    "lint:yaml": "yamllint -c .yamllint.yml manifests/ manifests/apps manifests/disaster-recovery manifests/rbac manifests/crossplane manifests/vault manifests/external-secrets",
    "lint:helm": "helm lint charts/ --values charts/values.yaml",
    "format:yaml": "prettier --write 'manifests/**/*.yaml' 'manifests/**/*.yml'",
    "prettier:check": "prettier --check 'manifests/**/*.yaml' 'manifests/**/*.yml'",
    "security:scan": "trivy fs --security-checks vuln,config manifests/",
    "security:scan:images": "trivy image --severity HIGH,CRITICAL $(kubectl get pods -A -o jsonpath='{range .items[*]}{.spec.containers[*].image}{"\n"}{end}' | sort -u)",
    "audit:argocd": "argocd app history fintech-app --output wide",
    "audit:rbac": "kubectl auth can --list --as=system:serviceaccount:default:default",
    "backup:all": "kubectl get all -A -o yaml > /backups/full-manifest-$(date +%Y%m%d-%H%M%S).yaml && kubectl get crd -o yaml >> /backups/full-manifest-$(date +%Y%m%d-%H%M%S).yaml",
    "restore:manifest": "kubectl apply -f /backups/full-manifest-latest.yaml",
    "metrics:argocd": "argocd app metrics fintech-app",
    "metrics:cluster": "kubectl top nodes && kubectl top pods -A",
    "grafana:import": "curl -X POST http://grafana.fintech.internal/api/dashboards/import -H 'Content-Type: application/json' -d @dashboards/multi-cluster-dashboard.json",
    "alert:configure": "kubectl apply -f manifests/monitoring/alert-rules.yaml",
    "cleanup:orphaned": "kubectl get pv | grep -v Bound | awk '{print $1}' | xargs -r kubectl delete pv",
    "cleanup:completed": "kubectl delete jobs -A --field-selector=status.successful=1"
  },
  "keywords": [
    "kubernetes",
    "argocd",
    "gitops",
    "crossplane",
    "vault",
    "multi-cluster",
    "disaster-recovery",
    "fintech",
    "aws",
    "infrastructure-as-code"
  ],
  "author": "Fintech Architecture Team",
  "license": "proprietary",
  "repository": {
    "type": "git",
    "url": "https://github.com/fintech/multi-cluster-control-plane"
  },
  "engines": {
    "node": ">=18.0.0",
    "npm": ">=9.0.0"
  },
  "devDependencies": {
    "@types/node": "^20.10.0",
    "@types/jest": "^29.5.0",
    "typescript": "^5.3.0",
    "prettier": "^3.1.0",
    "yamllint": "^1.33.0",
    "trivy": "^0.48.0",
    "helm": "^3.13.0",
    "kubectl": "^1.28.0",
    "argocd": "^2.10.0",
    "awscli": "^2.14.0",
    "jq": "^1.7.0"
  },
  "dependencies": {
    "js-yaml": "^4.1.0",
    "kubernetes-client": "^1.8.0",
    "@kubernetes/client-node": "^0.20.0",
    "axios": "^1.6.0",
    "dotenv": "^16.3.0"
  },
  "peerDependencies": {
    "kubectl": "^1.28.0",
    "helm": "^3.13.0",
    "argocd": "^2.10.0"
  },
  "optionalDependencies": {
    "vault": "^1.15.0",
    "aws-iam-authenticator": "^0.6.0"
  },
  "peerDependenciesMeta": {
    "vault": {
      "optional": true
    },
    "aws-iam-authenticator": {
      "optional": true
    }
  },
  "bundleDependencies": [],
  "overrides": {
    "js-yaml": "^4.1.0",
    "axios": "^1.6.0"
  },
  "resolutions": {
    "glob": "^10.3.0",
    "minimatch": "^9.0.0"
  },
  "publishConfig": {
    "registry": "https://npm.fintech.internal",
    "access": "restricted"
  },
  "sideEffects": false,
  "funding": {
    "type": "individual",
    "url": "https://fintech.internal/funding"
  }
}

// === ARCHIVO: manifests/argocd/application.yaml ===
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: fintech-app
  namespace: argocd
  labels:
    app: fintech-app
    environment: production
    managed-by: argocd
    cluster-type: workload
    replication-region: primary
    disaster-recovery: enabled
    compliance-tier: pci-dss
    owner: platform-team
    cost-center: infrastructure
  annotations:
    description: "Aplicacion principal del control plane multi-cluster para entorno de produccion"
    owner: platform-team@fintech.internal
    repository: https://github.com/fintech/multi-cluster-control-plane
    branch: main
    path: manifests/apps
    argocd.argoproj.io/sync-wave: "0"
    argocd.argoproj.io/sync-options: Prune=true
    argocd.argoproj.io/compare-options: IgnoreMissing=true
    argocd.argoproj.io/health-check: |
      {
        "apiVersion": "v1",
        "kind": "Service",
        "metadata.name": "fintech-service",
        "path": "/healthz"
      }
    crossplane.io/provisioner: composite
    vault.io/secret-path: secret/data/fintech/prod
    monitoring.prometheus.io/scrape: "true"
    monitoring.prometheus.io/port: "8080"
    monitoring.prometheus.io/path: /metrics
    disaster-recovery.fintech.internal/rpo: "1m"
    disaster-recovery.fintech.internal/rto: "5m"
    disaster-recovery.fintech.internal/region: us-east-1
    disaster-recovery.fintech.internal/backup-enabled: "true"
    backup.velero.io/schedule: daily-backup
    backup.velero.io/included-resources: "deployments,services,configmaps,secrets"
spec:
  project: fintech-project
  source:
    repoURL: https://github.com/fintech/multi-cluster-control-plane
    targetRevision: main
    path: manifests/apps
    helm:
      valueFiles:
        - values-prod.yaml
      parameters:
        - name: replicaCount
          value: "3"
        - name: image.tag
          value: v2.5.0-prod
        - name: ingress.enabled
          value: "true"
        - name: ingress.host
          value: fintech.fintech.internal
        - name: ingress.tls.secretName
          value: fintech-tls
        - name: resources.limits.cpu
          value: "2000m"
        - name: resources.limits.memory
          value: 4Gi
        - name: resources.requests.cpu
          value: "500m"
        - name: resources.requests.memory
          value: 1Gi
        - name: autoscaling.enabled
          value: "true"
        - name: autoscaling.minReplicas
          value: "3"
        - name: autoscaling.maxReplicas
          value: "10"
        - name: autoscaling.targetCPUUtilizationPercentage
          value: "70"
        - name: autoscaling.targetMemoryUtilizationPercentage
          value: "80"
        - name: serviceMonitor.enabled
          value: "true"
        - name: serviceMonitor.interval
          value: 30s
        - name: serviceMonitor.scrapeTimeout
          value: 10s
        - name: podDisruptionBudget.enabled
          value: "true"
        - name: podDisruptionBudget.minAvailable
          value: "2"
        - name: podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution
          value: "true"
        - name: podAntiAffinity.weight
          value: "100"
        - name: topologySpreadConstraints.maxSkew
          value: "1"
        - name: topologySpreadConstraints.topologyKey
          value: topology.kubernetes.io/zone
        - name: topologySpreadConstraints.whenUnsatisfiable
          value: ScheduleAnyway
        - name: tolerations[0].key
          value: workload-type
        - name: tolerations[0].operator
          value: Equal
        - name: tolerations[0].value
          value: production
        - name: tolerations[0].effect
          value: NoSchedule
        - name: nodeSelector.workload-type
          value: production
        - name: affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key
          value: node-group
        - name: affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator
          value: In
        - name: affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0]
          value: compute-optimized
        - name: priorityClassName
          value: system-cluster-critical
        - name: terminationGracePeriodSeconds
          value: "60"
        - name: readinessProbe.initialDelaySeconds
          value: "10"
        - name: readinessProbe.periodSeconds
          value: "5"
        - name: readinessProbe.successThreshold
          value: "1"
        - name: readinessProbe.failureThreshold
          value: "3"
        - name: livenessProbe.initialDelaySeconds
          value: "30"
        - name: livenessProbe.periodSeconds
          value: "10"
        - name: livenessProbe.successThreshold
          value: "1"
        - name: livenessProbe.failureThreshold
          value: "3"
        - name: startupProbe.initialDelaySeconds
          value: "5"
        - name: startupProbe.periodSeconds
          value: "10"
        - name: startupProbe.failureThreshold
          value: "30"
    directory:
      recurse: true
      jsonnet:
        extVars:
          - name: environment
            value: production
            eval: false
          - name: clusterName
            value: primary-cluster
            eval: false
          - name: region
            value: us-east-1
            eval: false
          - name: azCount
            value: "3"
            eval: false
  destination:
    server: https://kubernetes.default.svc
    namespace: fintech-production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
      allowEmpty: false
      retry:
        limit: 5
        backoff:
          duration: 5s
          factor: 2
          maxDuration: 3m
    syncOptions:
      - CreateNamespace=true
      - PrunePropagationPolicy=foreground
      - PruneLast=true
      - RespectIgnoreDifferences=true
      - ApplyOutOfSyncOnly=false
    retry:
      limit: 5
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 3m
  ignoreDifferences:
    - group: apps
      kind: Deployment
      jsonPointers:
        - /spec/replicas
    - group: ""
      kind: ConfigMap
      jsonPointers:
        - /data
    - group: ""
      kind: Secret
      jsonPointers:
        - /data
  revisionHistoryLimit: 10
  info:
    - name: architecture
      value: multi-cluster-gitops
    - name: replication
      value: active-active
    - name: disaster-recovery
      value: enabled
    - name: rpo
      value: 1m
    - name: rto
      value: 5m
    - name: backup-frequency
      value: hourly
    - name: monitoring
      value: prometheus
    - name: alerting
      value: pagerduty
    - name: compliance
      value: pci-dss
    - name: encryption
      value: at-rest-and-in-transit


// === ARCHIVO: clusters/primary-cluster.yaml ===
apiVersion: cluster.x-k8s.io/v1beta1
kind: Cluster
metadata:
  name: fintech-primary-us-east-1
  namespace: fleet-management
  labels:
    cluster.fintech.internal/role: primary
    cluster.fintech.internal/region: us-east-1
    cluster.fintech.internal/environment: production
    cluster.fintech.internal/tier: critical
    argocd.fintech.internal/app-set: fintech-prod
    crossplane.fintech.internal/provider: aws
  annotations:
    cluster.fintech.internal/description: "Cluster primario principal para cargas de trabajo fintech en US East 1"
    cluster.fintech.internal/owner: "Platform Engineering Team"
    cluster.fintech.internal/contact: "platform@fintech.internal"
    cluster.fintech.internal/sla-availability: "99.99%"
    cluster.fintech.internal/rpo: "1min"
    cluster.fintech.internal/rto: "5min"
    health.fintech.internal/interval: "30s"
    health.fintech.internal/timeout: "10s"
    health.fintech.internal/grace-period: "2m"
    health.fintech.internal/liveness-probe: "enabled"
    health.fintech.internal/readiness-probe: "enabled"
    monitoring.fintech.internal/prometheus: "enabled"
    monitoring.fintech.internal/scrape-interval: "15s"
    monitoring.fintech.internal/metrics-path: "/metrics"
    monitoring.fintech.internal/alert-manager: "fintech-alerts"
    backup.fintech.internal/etcd-backup: "enabled"
    backup.fintech.internal/etcd-backup-schedule: "0 */6 * * *"
    backup.fintech.internal/etcd-backup-retention: "7d"
    backup.fintech.internal/velero-schedule: "daily-full"
    failover.fintech.internal/auto-failover: "enabled"
    failover.fintech.internal/priority: "1"
    failover.fintech.internal/health-check-endpoint: "/healthz"
    failover.fintech.internal/failover-timeout: "300s"
    failover.fintech.internal/pre-failover-script: "/scripts/pre-failover-hooks.sh"
    failover.fintech.internal/post-failover-script: "/scripts/post-failover-hooks.sh"
    vault.fintech.internal/secrets-engine: "kv-v2"
    vault.fintech.internal/auth-method: "kubernetes"
    vault.fintech.internal/secret-path: "secret/data/fintech/primary-us-east-1"
    external-secrets.fintech.internal/store: "vault-backend"
    external-secrets.fintech.internal/sync-interval: "5m"
    argocd.fintech.internal/project: "fintech-production"
    argocd.fintech.internal/source-repo: "https://github.com/fintech/multi-cluster-control-plane"
    argocd.fintech.internal/sync-policy: "automated"
    argocd.fintech.internal/autosync: "true"
    argocd.fintech.internal/prune: "true"
    argocd.fintech.internal/self-heal: "true"
spec:
  clusterNetwork:
    pods:
      cidrBlocks:
        - "10.244.0.0/16"
    services:
      cidrBlocks:
        - "10.245.0.0/16"
    serviceDomain: "cluster.local"
  controlPlaneRef:
    apiVersion: controlplane.cluster.x-k8s.io/v1beta1
    kind: KubeadmControlPlane
    name: fintech-primary-us-east-1-control-plane
  infrastructureRef:
    apiVersion: infrastructure.cluster.x-k8s.io/v1beta1
    kind: AWSCluster
    name: fintech-primary-us-east-1
---
apiVersion: controlplane.cluster.x-k8s.io/v1beta1
kind: KubeadmControlPlane
metadata:
  name: fintech-primary-us-east-1-control-plane
  namespace: fleet-management
  labels:
    cluster.fintech.internal/cluster-name: fintech-primary-us-east-1
  annotations:
    controlplane.fintech.internal/description: "Plano de control del cluster primario"
    controlplane.fintech.internal/replicas: "3"
    controlplane.fintech.internal/etcd-endpoints: "etcd-0.fintech-primary-etcd,etcd-1.fintech-primary-etcd,etcd-2.fintech-primary-etcd"
    controlplane.fintech.internal/etcd-tls-enabled: "true"
    controlplane.fintech.internal/api-server-ha: "enabled"
    controlplane.fintech.internal/audit-logging: "enabled"
    controlplane.fintech.internal/audit-policy: "/etc/kubernetes/audit-policy.yaml"
spec:
  replicas: 3
  version: "v1.28.0"
  kubeadmConfigSpec:
    clusterConfiguration:
      etcd:
        local:
          dataDir: "/var/lib/etcd"
          extraArgs:
            listen-client-urls: "https://127.0.0.1:2379,https://$(HOST_IP):2379"
            advertise-client-urls: "https://$(HOST_IP):2379"
            listen-peer-urls: "https://$(HOST_IP):2380"
            initial-advertise-peer-urls: "https://$(HOST_IP):2380"
            initial-cluster: "etcd-0=https://$(HOST_IP):2380,etcd-1=https://$(HOST_1_IP):2380,etcd-2=https://$(HOST_2_IP):2380"
            initial-cluster-state: "new"
            initial-cluster-token: "etcd-cluster-fintech-primary"
            name: "$(HOSTNAME)"
          serverCertSANs:
            - "localhost"
            - "127.0.0.1"
            - "$(HOST_IP)"
          peerCertSANs:
            - "localhost"
            - "127.0.0.1"
            - "$(HOST_IP)"
      apiServer:
        extraArgs:
          authorization-mode: "Node,RBAC"
          enable-admission-plugins: "NodeRestriction,PodSecurityPolicy,EventRateLimit"
          audit-log-maxsize: "100"
          audit-log-maxbackup: "10"
          audit-log-maxage: "30"
          profiling: "false"
          service-account-issuer: "https://kubernetes.default.svc.cluster.local"
          service-account-signing-key-file: "/etc/kubernetes/pki/sa.key"
        extraVolumes:
          - name: audit-log
            hostPath: "/var/log/kubernetes/audit"
            mountPath: /var/log/kubernetes/audit
            readOnly: false
          - name: audit-policy
            hostPath: /etc/kubernetes/audit-policy.yaml
            mountPath: /etc/kubernetes/audit-policy.yaml
            readOnly: true
        certSANs:
          - "kubernetes"
          - "kubernetes.default"
          - "kubernetes.default.svc"
          - "kubernetes.default.svc.cluster.local"
          - "10.245.0.1"
          - "api.fintech-primary.internal"
          - "api.fintech-primary.fintech.internal"
      controllerManager:
        extraArgs:
          cluster-signing-cert-file: "/etc/kubernetes/pki/ca.crt"
          cluster-signing-key-file: "/etc/kubernetes/pki/ca.key"
          leader-elect: "true"
          leader-elect-lease-duration: "15s"
          leader-elect-renew-deadline: "10s"
          leader-elect-retry-period: "5s"
          service-cluster-ip-range: "10.245.0.0/16"
          pod-eviction-timeout: "30s"
          terminated-pod-gc-threshold: "1000"
      scheduler:
        extraArgs:
          leader-elect: "true"
          leader-elect-lease-duration: "15s"
          leader-elect-renew-deadline: "10s"
          leader-elect-retry-period: "5s"
    initConfiguration:
      nodeRegistration:
        kubeletExtraArgs:
          cgroup-driver: "systemd"
          cgroups-per-qos: "true"
          enforce-node-allocatable: "pods"
          eviction-hard: "memory.available<100Mi,nodefs.available<5%,imagefs.available<5%"
          eviction-soft: "memory.available<500Mi,nodefs.available<10%,imagefs.available<10%"
          eviction-soft-grace-period: "memory.available=5m,nodefs.available=5m,imagefs.available=5m"
          max-pods: "110"
          kube-reserved: "cpu=200m,memory=1Gi,ephemeral-storage=1Gi"
          system-reserved: "cpu=100m,memory=512Mi,ephemeral-storage=1Gi"
          image-gc-high-threshold: "85"
          image-gc-low-threshold: "80"
      certificatesDir: "/etc/kubernetes/pki"
      discovery:
        timeout: "5m0s"
    joinConfiguration:
      nodeRegistration:
        kubeletExtraArgs:
          cgroup-driver: "systemd"
          cgroups-per-qos: "true"
          enforce-node-allocatable: "pods"
          max-pods: "110"
      certificatesDir: "/etc/kubernetes/pki"
      discovery:
        timeout: "5m0s"
  rolloutAfter: "2024-12-31T23:59:59Z"
  strategy:
    type: "RollingUpdate"
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
---
apiVersion: infrastructure.cluster.x-k8s.io/v1beta1
kind: AWSCluster
metadata:
  name: fintech-primary-us-east-1
  namespace: fleet-management
  labels:
    cluster.fintech.internal/cluster-name: fintech-primary-us-east-1
  annotations:
    infrastructure.fintech.internal/description: "Infraestructura AWS del cluster primario"
    infrastructure.fintech.internal/vpc-cidr: "10.0.0.0/16"
    infrastructure.fintech.internal/availability-zones: "us-east-1a,us-east-1b,us-east-1c"
    infrastructure.fintech.internal/vpc-flow-logs: "enabled"
    infrastructure.fintech.internal/nat-gateway: "enabled"
    infrastructure.fintech.internal/load-balancer-type: "nlb"
spec:
  region: "us-east-1"
  sshKeyName: "fintech-prod-ssh-key"
  controlPlaneLoadBalancer:
    scheme: "Internet-facing"
    crossZoneLoadBalancingEnabled: true
  networkSpec:
    vpc:
      cidrBlock: "10.0.0.0/16"
      enableDnsHostnames: true
      enableDnsSupport: true
      flowLogs:
        - destination: "CloudWatch"
          filterType: "ALL"
          logFormat: "json"
          logRetention: "30"
    subnets:
      - cidrBlock: "10.0.1.0/24"
        availabilityZone: "us-east-1a"
        isPublic: true
        natGatewayConfig:
          enabled: true
        tags:
          cluster.fintech.internal/role: "public"
          cluster.fintech.internal/subnet-type: "control-plane"
      - cidrBlock: "10.0.2.0/24"
        availabilityZone: "us-east-1b"
        isPublic: true
        natGatewayConfig:
          enabled: true
        tags:
          cluster.fintech.internal/role: "public"
          cluster.fintech.internal/subnet-type: "control-plane"
      - cidrBlock: "10.0.3.0/24"
        availabilityZone: "us-east-1c"
        isPublic: true
        natGatewayConfig:
          enabled: true
        tags:
          cluster.fintech.internal/role: "public"
          cluster.fintech.internal/subnet-type: "control-plane"
      - cidrBlock: "10.0.10.0/24"
        availabilityZone: "us-east-1a"
        isPublic: false
        tags:
          cluster.fintech.internal/role: "private"
          cluster.fintech.internal/subnet-type: "worker"
      - cidrBlock: "10.0.11.0/24"
        availabilityZone: "us-east-1b"
        isPublic: false
        tags:
          cluster.fintech.internal/role: "private"
          cluster.fintech.internal/subnet-type: "worker"
      - cidrBlock: "10.0.12.0/24"
        availabilityZone: "us-east-1c"
        isPublic: false
        tags:
          cluster.fintech.internal/role: "private"
          cluster.fintech.internal/subnet-type: "worker"
  bastion:
    enabled: true
    allowedCIDRBlocks:
      - "10.0.0.0/8"
    instanceType: "t3.small"
  ---
apiVersion: v1
kind: Service
metadata:
  name: fintech-primary-api-server
  namespace: fleet-management
  labels:
    cluster.fintech.internal/cluster-name: fintech-primary-us-east-1
  annotations:
    service.fintech.internal/type: "NLB"
    service.fintech.internal/health-check-path: "/healthz"
    service.fintech.internal/health-check-interval: "30s"
    service.fintech.internal/healthy-threshold: "3"
    service.fintech.internal/unhealthy-threshold: "3"
    service.fintech.internal/timeout: "10s"
spec:
  type: LoadBalancer
  selector:
    component: etcd
  ports:
    - name: etcd-client
      port: 2379
      targetPort: 2379
      protocol: TCP
    - name: etcd-peer
      port: 2380
      targetPort: 2380
      protocol: TCP
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cluster-health-config
  namespace: fleet-management
  labels:
    cluster.fintech.internal/cluster-name: fintech-primary-us-east-1
data:
  health-check-config.yaml: |
    healthChecks:
      - name: etcd-health
        type: http
        endpoint: https://localhost:2379/health
        interval: 30s
        timeout: 10s
        enabled: true
      - name: api-server-health
        type: http
        endpoint: https://localhost:6443/healthz
        interval: 30s
        timeout: 10s
        enabled: true
      - name: controller-manager-health
        type: http
        endpoint: https://localhost:10257/healthz
        interval: 30s
        timeout: 10s
        enabled: true
      - name: scheduler-health
        type: http
        endpoint: https://localhost:10251/healthz
        interval: 30s
        timeout: 10s
        enabled: true
      - name: kubelet-health
        type: http
        endpoint: https://localhost:10248/healthz
        interval: 30s
        timeout: 10s
        enabled: true
  metrics-config.yaml: |
    metrics:
      - name: etcd-db-size
        type: gauge
        help: "Size of etcd database in bytes"
        scrapeInterval: 15s
      - name: api-request-latency
        type: histogram
        help: "API server request latency in seconds"
        buckets: [0.001, 0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0]
        scrapeInterval: 15s
      - name: cluster-node-count
        type: gauge
        help: "Number of nodes in the cluster"
        scrapeInterval: 30s
      - name: cluster-pod-count
        type: gauge
        help: "Number of pods in the cluster"
        scrapeInterval: 30s
// === ARCHIVO: clusters/standby-clusters.yaml ===
apiVersion: cluster.x-k8s.io/v1beta1
kind: Cluster
metadata:
  name: fintech-standby-us-west-2
  namespace: fleet-management
  labels:
    cluster.fintech.internal/role: standby
    cluster.fintech.internal/region: us-west-2
    cluster.fintech.internal/environment: production
    cluster.fintech.internal/tier: critical
    cluster.fintech.internal/failover-target: fintech-primary-us-east-1
    argocd.fintech.internal/app-set: fintech-prod-standby
    crossplane.fintech.internal/provider: aws
  annotations:
    cluster.fintech.internal/description: "Cluster standby para failover en US West 2"
    cluster.fintech.internal/owner: "Platform Engineering Team"
    cluster.fintech.internal/contact: "platform@fintech.internal"
    cluster.fintech.internal/sla-availability: "99.99%"
    cluster.fintech.internal/rpo: "1min"
    cluster.fintech.internal/rto: "5min"
    health.fintech.internal/interval: "30s"
    health.fintech.internal/timeout: "10s"
    health.fintech.internal/grace-period: "2m"
    health.fintech.internal/liveness-probe: "enabled"
    health.fintech.internal/readiness-probe: "enabled"
    monitoring.fintech.internal/prometheus: "enabled"
    monitoring.fintech.internal/scrape-interval: "15s"
    monitoring.fintech.internal/metrics-path: "/metrics"
    monitoring.fintech.internal/alert-manager: "fintech-alerts"
    backup.fintech.internal/etcd-backup: "enabled"
    backup.fintech.internal/etcd-backup-schedule: "0 */6 * * *"
    backup.fintech.internal/etcd-backup-retention: "7d"
    failover.fintech.internal/auto-failover: "enabled"
    failover.fintech.internal/priority: "2"
    failover.fintech.internal/health-check-endpoint: "/healthz"
    failover.fintech.internal/failover-timeout: "300s"
    failover.fintech.internal/sync-from-primary: "enabled"
    failover.fintech.internal/replication-lag-threshold: "10s"
    failover.fintech.internal/pre-failover-script: "/scripts/pre-failover-hooks.sh"
    failover.fintech.internal/post-failover-script: "/scripts/post-failover-hooks.sh"
    vault.fintech.internal/secrets-engine: "kv-v2"
    vault.fintech.internal/auth-method: "kubernetes"
    vault.fintech.internal/secret-path: "secret/data/fintech/standby-us-west-2"
    external-secrets.fintech.internal/store: "vault-backend"
    external-secrets.fintech.internal/sync-interval: "5m"
    argocd.fintech.internal/project: "fintech-production-standby"
    argocd.fintech.internal/source-repo: "https://github.com/fintech/multi-cluster-control-plane"
    argocd.fintech.internal/sync-policy: "automated"
spec:
  clusterNetwork:
    pods:
      cidrBlocks:
        - "10.246.0.0/16"
    services:
      cidrBlocks:
        - "10.247.0.0/16"
    serviceDomain: "cluster.local"
  controlPlaneRef:
    apiVersion: controlplane.cluster.x-k8s.io/v1beta1
    kind: KubeadmControlPlane
    name: fintech-standby-us-west-2-control-plane
  infrastructureRef:
    apiVersion: infrastructure.cluster.x-k8s.io/v1beta1
    kind: AWSCluster
    name: fintech-standby-us-west-2
---
apiVersion: cluster.x-k8s.io/v1beta1
kind: Cluster
metadata:
  name: fintech-standby-eu-west-1
  namespace: fleet-management
  labels:
    cluster.fintech.internal/role: standby
    cluster.fintech.internal/region: eu-west-1
    cluster.fintech.internal/environment: production
    cluster.fintech.internal/tier: critical
    cluster.fintech.internal/failover-target: fintech-primary-us-east-1
    argocd.fintech.internal/app-set: fintech-prod-standby
    crossplane.fintech.internal/provider: aws
  annotations:
    cluster.fintech.internal/description: "Cluster standby para failover en EU West 1"
    cluster.fintech.internal/owner: "Platform Engineering Team"
    cluster.fintech.internal/contact: "platform@fintech.internal"
    cluster.fintech.internal/sla-availability: "99.99%"
    cluster.fintech.internal/rpo: "1min"
    cluster.fintech.internal/rto: "5min"
    health.fintech.internal/interval: "30s"
    health.fintech.internal/timeout: "10s"
    health.fintech.internal/grace-period: "2m"
    health.fintech.internal/liveness-probe: "enabled"
    health.fintech.internal/readiness-probe: "enabled"
    monitoring.fintech.internal/prometheus: "enabled"
    monitoring.fintech.internal/scrape-interval: "15s"
    monitoring.fintech.internal/metrics-path: "/metrics"
    monitoring.fintech.internal/alert-manager: "fintech-alerts"
    backup.fintech.internal/etcd-backup: "enabled"
    backup.fintech.internal/etcd-backup-schedule: "0 */6 * * *"
    backup.fintech.internal/etcd-backup-retention: "7d"
    failover.fintech.internal/auto-failover: "enabled"
    failover.fintech.internal/priority: "3"
    failover.fintech.internal/health-check-endpoint: "/healthz"
    failover.fintech.internal/failover-timeout: "300s"
    failover.fintech.internal/sync-from-primary: "enabled"
    failover.fintech.internal/replication-lag-threshold: "10s"
    failover.fintech.internal/pre-failover-script: "/scripts/pre-failover-hooks.sh"
    failover.fintech.internal/post-failover-script: "/scripts/post-failover-hooks.sh"
    vault.fintech.internal/secrets-engine: "kv-v2"
    vault.fintech.internal/auth-method: "kubernetes"
    vault.fintech.internal/secret-path: "secret/data/fintech/standby-eu-west-1"
    external-secrets.fintech.internal/store: "vault-backend"
    external-secrets.fintech.internal/sync-interval: "5m"
    argocd.fintech.internal/project: "fintech-production-standby"
    argocd.fintech.internal/source-repo: "https://github.com/fintech/multi-cluster-control-plane"
    argocd.fintech.internal/sync-policy: "automated"
spec:
  clusterNetwork:
    pods:
      cidrBlocks:
        - "10.248.0.0/16"
    services:
      cidrBlocks:
        - "10.249.0.0/16"
    serviceDomain: "cluster.local"
  controlPlaneRef:
    apiVersion: controlplane.cluster.x-k8s.io/v1beta1
    kind: KubeadmControlPlane
    name: fintech-standby-eu-west-1-control-plane
  infrastructureRef:
    apiVersion: infrastructure.cluster.x-k8s.io/v1beta1
    kind: AWSCluster
    name: fintech-standby-eu-west-1
---
apiVersion: cluster.x-k8s.io/v1beta1
kind: Cluster
metadata:
  name: fintech-standby-ap-southeast-1
  namespace: fleet-management
  labels:
    cluster.fintech.internal/role: standby
    cluster.fintech.internal/region: ap-southeast-1
    cluster.fintech.internal/environment: production
    cluster.fintech.internal/tier: critical
    cluster.fintech.internal/failover-target: fintech-primary-us-east-1
    argocd.fintech.internal/app-set: fintech-prod-standby
    crossplane.fintech.internal/provider: aws
  annotations:
    cluster.fintech.internal/description: "Cluster standby para failover en Asia Pacific Singapore"
    cluster.fintech.internal/owner: "Platform Engineering Team"
    cluster.fintech.internal/contact: "platform@fintech.internal"
    cluster.fintech.internal/sla-availability: "99.99%"
    cluster.fintech.internal/rpo: "1min"
    cluster.fintech.internal/rto: "5min"
    health.fintech.internal/interval: "30s"
    health.fintech.internal/timeout: "10s"
    health.fintech.internal/grace-period: "2m"
    health.fintech.internal/liveness-probe: "enabled"
    health.fintech.internal/readiness-probe: "enabled"
    monitoring.fintech.internal/prometheus: "enabled"
    monitoring.fintech.internal/scrape-interval: "15s"
    monitoring.fintech.internal/metrics-path: "/metrics"
    monitoring.fintech.internal/alert-manager: "fintech-alerts"
    backup.fintech.internal/etcd-backup: "enabled"
    backup.fintech.internal/etcd-backup-schedule: "0 */6 * * *"
    backup.fintech.internal/etcd-backup-retention: "7d"
    failover.fintech.internal/auto-failover: "enabled"
    failover.fintech.internal/priority: "4"
    failover.fintech.internal/health-check-endpoint: "/healthz"
    failover.fintech.internal/failover-timeout: "300s"
    failover.fintech.internal/sync-from-primary: "enabled"
    failover.fintech.internal/replication-lag-threshold: "10s"
    failover.fintech.internal/pre-failover-script: "/scripts/pre-failover-hooks.sh"
    failover.fintech.internal/post-failover-script: "/scripts/post-failover-hooks.sh"
    vault.fintech.internal/secrets-engine: "kv-v2"
    vault.fintech.internal/auth-method: "kubernetes"
    vault.fintech.internal/secret-path: "secret/data/fintech/standby-ap-southeast-1"
    external-secrets.fintech.internal/store: "vault-backend"
    external-secrets.fintech.internal/sync-interval: "5m"
    argocd.fintech.internal/project: "fintech-production-standby"
    argocd.fintech.internal/source-repo: "https://github.com/fintech/multi-cluster-control-plane"
    argocd.fintech.internal/sync-policy: "automated"
spec:
  clusterNetwork:
    pods:
      cidrBlocks:
        - "10.250.0.0/16"
    services:
      cidrBlocks:
        - "10.251.0.0/16"
    serviceDomain: "cluster.local"
  controlPlaneRef:
    apiVersion: controlplane.cluster.x-k8s.io/v1beta1
    kind: KubeadmControlPlane
    name: fintech-standby-ap-southeast-1-control-plane
  infrastructureRef:
    apiVersion: infrastructure.cluster.x-k8s.io/v1beta1
    kind: AWSCluster
    name: fintech-standby-ap-southeast-1
---
apiVersion: cluster.x-k8s.io/v1beta1
kind: Cluster
metadata:
  name: fintech-standby-eu-central-1
  namespace: fleet-management
  labels:
    cluster.fintech.internal/role: standby
    cluster.fintech.internal/region: eu-central-1
    cluster.fintech.internal/environment: production
    cluster.fintech.internal/tier: critical
    cluster.fintech.internal/failover-target: fintech-primary-us-east-1
    argocd.fintech.internal/app-set: fintech-prod-standby
    crossplane.fintech.internal/provider: aws
  annotations:
    cluster.fintech.internal/description: "Cluster standby para failover en EU Central Frankfurt"
    cluster.fintech.internal/owner: "Platform Engineering Team"
    cluster.fintech.internal/contact: "platform@fintech.internal"
    cluster.fintech.internal/sla-availability: "99.99%"
    cluster.fintech.internal/rpo: "1min"
    cluster.fintech.internal/rto: "5min"
    health.fintech.internal/interval: "30s"
    health.fintech.internal/timeout: "10s"
    health.fintech.internal/grace-period: "2m"
    health.fintech.internal/liveness-probe: "enabled"
    health.fintech.internal/readiness-probe: "enabled"
    monitoring.fintech.internal/prometheus: "enabled"
    monitoring.fintech.internal/scrape-interval: "15s"
    monitoring.fintech.internal/metrics-path: "/metrics"
    monitoring.fintech.internal/alert-manager: "fintech-alerts"
    backup.fintech.internal/etcd-backup: "enabled"
    backup.fintech.internal/etcd-backup-schedule: "0 */6 * * *"
    backup.fintech.internal/etcd-backup-retention: "7d"
    failover.fintech.internal/auto-failover: "enabled"
    failover.fintech.internal/priority: "5"
    failover.fintech.internal/health-check-endpoint: "/healthz"
    failover.fintech.internal/failover-timeout: "300s"
    failover.fintech.internal/sync-from-primary: "enabled"
    failover.fintech.internal/replication-lag-threshold: "10s"
    failover.fintech.internal/pre-failover-script: "/scripts/pre-failover-hooks.sh"
    failover.fintech.internal/post-failover-script: "/scripts/post-failover-hooks.sh"
    vault.fintech.internal/secrets-engine: "kv-v2"
    vault.fintech.internal/auth-method: "kubernetes"
    vault.fintech.internal/secret-path: "secret/data/fintech/standby-eu-central-1"
    external-secrets.fintech.internal/store: "vault-backend"
    external-secrets.fintech.internal/sync-interval: "5m"
    argocd.fintech.internal/project: "fintech-production-standby"
    argocd.fintech.internal/source-repo: "https://github.com/fintech/multi-cluster-control-plane"
    argocd.fintech.internal/sync-policy: "automated"
spec:
  clusterNetwork:
    pods:
      cidrBlocks:
        - "10.252.0.0/16"
    services:
      cidrBlocks:
        - "10.253.0.0/16"
    serviceDomain: "cluster.local"
  controlPlaneRef:
    apiVersion: controlplane.cluster.x-k8s.io/v1beta1
    kind: KubeadmControlPlane
    name: fintech-standby-eu-central-1-control-plane
  infrastructureRef:
    apiVersion: infrastructure.cluster.x-k8s.io/v1beta1
    kind: AWSCluster
    name: fintech-standby-eu-central-1
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: failover-configuration
  namespace: fleet-management
  labels:
    config.fintech.internal/type: failover
data:
  failover-rules.yaml: |
    failoverPolicies:
      - name: primary-failure-detection
        type: health-check
        clusterSelector: cluster.fintech.internal/role=primary
        checkInterval: 30s
        failureThreshold: 3
        recoveryThreshold: 2
        timeout: 10s
        actions:
          - type: alert
            target: pagerduty
            severity: critical
          - type: execute-failover
            targetClusters:
              - fintech-standby-us-west-2
              - fintech-standby-eu-west-1
              - fintech-standby-ap-southeast-1
              - fintech-standby-eu-central-1
      - name: replication-lag-detection
        type: metric-threshold
        clusterSelector: cluster.fintech.internal/role=standby
        metric: etcd_replication_lag_seconds
        threshold: 10
        evaluationInterval: 15s
        actions:
          - type: alert
            target: slack
            severity: warning
          - type: pause-failover
            reason: "replication-lag-exceeded"
      - name: split-brain-prevention
        type: distributed-lock
        lockName: failover-activation
        lockTimeout: 300s
        consensusRequired: quorum
        regions:
          - us-east-1
          - us-west-2
          - eu-west-1
          - ap-southeast-1
          - eu-central-1
  priority-order.yaml: |
    failoverPriority:
      - cluster: fintech-standby-us-west-2
        priority: 2
        region: us-west-2
        weight: 100
        healthScore: 100
      - cluster: fintech-standby-eu-west-1
        priority: 3
        region: eu-west-1
        weight: 80
        healthScore: 100
      - cluster: fintech-standby-ap-southeast-1
        priority: 4
        region: ap-southeast-1
        weight: 60
        healthScore: 100
      - cluster: fintech-standby-eu-central-1
        priority: 5
        region: eu-central-1
        weight: 40
        healthScore: 100
  replication-config.yaml: |
    replicationSettings:
      mode: async
      syncInterval: 1m
      batchSize: 1000
      compression: snappy
      encryption: tls
      sourceCluster: fintech-primary-us-east-1
      targetClusters:
        - fintech-standby-us-west-2
        - fintech-standby-eu-west-1
        - fintech-standby-ap-southeast-1
        - fintech-standby-eu-central-1
      resources:
        - kind: Secret
          apiVersion: v1
          namespace: "*"
        - kind: ConfigMap
          apiVersion: v1
          namespace: "*"
        - kind: Service
          apiVersion: v1
          namespace: production
        - kind: Ingress
          apiVersion: networking.k8s.io/v1
          namespace: production
        - kind: Deployment
          apiVersion: apps/v1
          namespace: production
        - kind: StatefulSet
          apiVersion: apps/v1
          namespace: production
      filters:
        exclude:
          - field: metadata.annotations
            contains: cluster.fintech.internal/local-only
        include:
          - field: metadata.labels
            contains: cluster.fintech.internal/replicate=true
---
apiVersion: v1
kind: Service
metadata:
  name: failover-coordinator
  namespace: fleet-management
  labels:
    app.fintech.internal: failover-coordinator
spec:
  type: ClusterIP
  ports:
    - port: 8080
      targetPort: 8080
      name: http
    - port: 8443
      targetPort: 8443
      name: https
  selector:
    app: failover-coordinator
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: failover-coordinator
  namespace: fleet-management
  labels:
    app.fintech.internal: failover-coordinator
spec:
  replicas: 3
  selector:
    matchLabels:
      app: failover-coordinator
  template:
    metadata:
      labels:
        app: failover-coordinator
    spec:
      serviceAccountName: failover-controller
      containers:
        - name: coordinator
          image: fintech/failover-coordinator:v1.0.0
          ports:
            - containerPort: 8080
              name: http
            - containerPort: 8443
              name: https
          env:
            - name: PRIMARY_CLUSTER
              value: fintech-primary-us-east-1
            - name: STANDBY_CLUSTERS
              value: fintech-standby-us-west-2,fintech-standby-eu-west-1,fintech-standby-ap-southeast-1,fintech-standby-eu-central-1
            - name: FAILOVER_TIMEOUT
              value: "300"
            - name: HEALTH_CHECK_INTERVAL
              value: "30"
            - name: REPLICATION_LAG_THRESHOLD
              value: "10"
          volumeMounts:
            - name: config
              mountPath: /config
              readOnly: true
      volumes:
        - name: config
          configMap:
            name: failover-configuration


// === ARCHIVO: manifests/argocd/argocd-cm.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
  labels:
    app.kubernetes.io/name: argocd-cm
    app.kubernetes.io/part-of: argocd
  annotations:
    description: "Configuración centralizada de ArgoCD para el control plane multi-cluster de fintech"
    owner: "plataforma-infraestructura"
    documentation: "https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/"
data:
  # Configuración del servidor ArgoCD
  config.yaml: |
    resource.customizations:
      argoproj.io.Application:
        health.lua: |
          hs = {}
          hs.status = "Progressing"
          hs.message = ""
          if obj.status ~= nil then
            if obj.status.health ~= nil then
              hs.status = obj.status.health.status
              if obj.status.health.message ~= nil then
                hs.message = obj.status.health.message
              end
            end
          end
          return hs
    resource.compareoptions:
      ignoreDifferences: |
        group:
        - kind: Secret
        - kind: ConfigMap
        - kind: OAuth2
        - kind: Certificate
        kind:
        - Ingress
        - Service
        jsonPointers:
        - /spec/replicas
    resource.autosync.enabled: "true"
    resource.autosync.prune: "true"
    resource.autosync.selfHeal: "true"
    resource.timeout.reconciliation: "300s"
    resource.connection.stableTimeout: "60s"

  # Repositorios Git permitidos para GitOps
  repositories: |
    - url: https://github.com/fintech/multi-cluster-control-plane
      type: git
      name: fintech-gitops-repo
    - url: https://github.com/fintech/application-manifests
      type: git
      name: fintech-app-manifests
    - url: https://github.com/fintech/infrastructure-manifests
      type: git
      name: fintech-infra-manifests
    - url: https://github.com/fintech/security-policies
      type: git
      name: fintech-security-policies
    - url: https://github.com/fintech/helm-charts
      type: helm
      name: fintech-helm-charts

  # Repositorios SSH permitidos
  repository.credentials: |
    - url: git@github.com:fintech/
      sshPrivateKeySecret:
        key: ssh-private-key
        name: argocd-repo-creds

  # URLs de los clusters gestionados
  clusterManagement: |
    clusters:
      - name: primary-us-east-1
        server: https://kubernetes.us-east-1.fintech.internal:6443
        config:
          tlsClientConfig:
            insecure: false
            caData: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURQekNDQWllZ0F3SUJBZ0lVVzZoK0pDVW5vR1Q4
      - name: primary-us-west-2
        server: https://kubernetes.us-west-2.fintech.internal:6443
        config:
          tlsClientConfig:
            insecure: false
            caData: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURQekNDQWllZ0F3SUJBZ0lVVzZoK0pDVW5vR1Q4
      - name: standby-eu-west-1
        server: https://kubernetes.eu-west-1.fintech.internal:6443
        config:
          tlsClientConfig:
            insecure: false
            caData: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURQekNDQWllZ0F3SUJBZ0lVVzZoK0pDVW5vR1Q4
      - name: standby-ap-southeast-1
        server: https://kubernetes.ap-southeast-1.fintech.internal:6443
        config:
          tlsClientConfig:
            insecure: false
            caData: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURQekNDQWllZ0F3SUJBZ0lVVzZoK0pDVW5vR1Q4

  # Configuración de proyectos ArgoCD
  projects: |
    - name: fintech-platform
      description: "Proyecto principal para la plataforma fintech"
      destinations:
        - server: https://kubernetes.us-east-1.fintech.internal:6443
          namespace: argocd
        - server: https://kubernetes.us-east-1.fintech.internal:6443
          namespace: fintech-apps
        - server: https://kubernetes.us-west-2.fintech.internal:6443
          namespace: fintech-apps
        - server: https://kubernetes.eu-west-1.fintech.internal:6443
          namespace: fintech-apps
        - server: https://kubernetes.ap-southeast-1.fintech.internal:6443
          namespace: fintech-apps
      sourceRepos:
        - https://github.com/fintech/multi-cluster-control-plane
        - https://github.com/fintech/application-manifests
        - https://github.com/fintech/infrastructure-manifests
        - https://github.com/fintech/security-policies
      clusterResourceBlacklist:
        - group: ""
          kind: "Namespace"
      namespaceResourceBlacklist:
        - group: "rbac.authorization.k8s.io"
          kind: "ClusterRole"
        - group: "rbac.authorization.k8s.io"
          kind: "ClusterRoleBinding"
      namespaceResourceWhitelist:
        - group: ""
          kind: "Service"
        - group: ""
          kind: "ConfigMap"
        - group: "apps"
          kind: "Deployment"
        - group: "apps"
          kind: "StatefulSet"
        - group: ""
          kind: "Secret"

    - name: fintech-infra
      description: "Proyecto para componentes de infraestructura"
      destinations:
        - server: https://kubernetes.us-east-1.fintech.internal:6443
          namespace: infrastructure
        - server: https://kubernetes.us-west-2.fintech.internal:6443
          namespace: infrastructure
        - server: https://kubernetes.eu-west-1.fintech.internal:6443
          namespace: infrastructure
        - server: https://kubernetes.ap-southeast-1.fintech.internal:6443
          namespace: infrastructure
      sourceRepos:
        - https://github.com/fintech/infrastructure-manifests
        - https://github.com/fintech/helm-charts
      clusterResourceWhitelist:
        - group: ""
          kind: "Namespace"
        - group: "rbac.authorization.k8s.io"
          kind: "ClusterRole"
        - group: "rbac.authorization.k8s.io"
          kind: "ClusterRoleBinding"
        - group: "storage.k8s.io"
          kind: "StorageClass"
        - group: "crossplane.io"
          kind: "*"

  # Configuración de sincronización
  syncPolicy: |
    autoSync: true
    prune: true
    selfHeal: true
    allowEmpty: false
    retry:
      limit: 5
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 3m

  # Configuración de notificaciones
  notifications.enabled: "true"
  notifications.slack.enabled: "true"
  notifications.slack.channel: "#argocd-alerts"
  notifications.slack.username: "ArgoCD Control Plane"
  notifications.email.enabled: "true"
  notifications.email.from: "argocd@fintech.internal"
  notifications.email.to: "plataforma@fintech.internal"

  # Políticas de seguridad
  security.policy: |
    server.rbac.log.enforce: "true"
    server.rbac.log.enforce.in: "request"
    server.rbac.log.enforce.out: "response"
    server.rbac.policy: |
      g, platform-admins, role:admin
      g, platform-operators, role:readonly
      g, developers, role:deployer
    server.rbac.default.role: "readonly"

  # Configuración de métricas y observabilidad
  metrics.enabled: "true"
  metrics.port: "8083"
  metrics.cache.enabled: "true"
  metrics.cache.ttl: "1h"

  # Configuración de sesión
  session.maxAge: "24h"
  session.timeout: "720h"
  server.rbac.log.enforce: "true"

  # URL del servidor ArgoCD
  url: https://argocd.fintech.internal

  # Configuración de TLS
  tls.caData: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURQekNDQWllZ0F3SUJBZ0lVVzZoK0pDVW5vR1Q4
  # === ARCHIVO: manifests/crossplane/providers.yaml ===
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-aws
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: provider-aws
    app.kubernetes.io/part-of: crossplane
    region: global
  annotations:
    description: "Provider de AWS para Crossplane que permite gestionar recursos de infraestructura"
    owner: "plataforma-infraestructura"
    version: "v0.47.0"
    documentation: "https://docs.crossplane.io/v1.14/concepts/providers/"
spec:
  package: xpkg.upbound.io/upbound/provider-aws:v0.47.0
  controllerConfigRef:
    name: aws-controller-config
  revisionActivationPolicy: Automatic
  revisionHistoryLimit: 1
---
apiVersion: pkg.crossplane.io/v1alpha1
kind: ControllerConfig
metadata:
  name: aws-controller-config
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: crossplane-aws-controller
  annotations:
    description: "Configuración del controlador de AWS para Crossplane con recursos optimizados"
    owner: "plataforma-infraestructura"
spec:
  image: xpkg.upbound.io/upbound/provider-aws:v0.47.0
  args:
    - --debug
    - --max-reconcile-rate=100
    - --poll-interval=10m
    - --poll-jitter=2m
  env:
    - name: AWS_DEFAULT_REGION
      value: us-east-1
    - name: AWS_MAX_RETRIES
      value: "10"
    - name: AWS_MAX_BACKOFF_DELAY_MS
      value: "30000"
    - name: ENABLE_EXTERNAL_SECRET_STORAGE
      value: "true"
  resources:
    limits:
      cpu: 500m
      memory: 512Mi
    requests:
      cpu: 100m
      memory: 256Mi
  serviceAccountName: crossplane-aws-provider
  nodeSelector:
    workload: infrastructure
  tolerations:
    - key: dedicated
      operator: Equal
      value: infrastructure
      effect: NoSchedule
  affinity:
    nodeAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 100
          preference:
            matchExpressions:
              - key: topology.kubernetes.io/zone
                operator: In
                values:
                  - us-east-1a
---
apiVersion: v1
kind: Secret
metadata:
  name: aws-provider-creds
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: crossplane-aws-credentials
type: Opaque
stringData:
  credentials: |
    [default]
    aws_access_key_id = ${AWS_ACCESS_KEY_ID}
    aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
    region = us-east-1
    
    [production]
    aws_access_key_id = ${AWS_PROD_ACCESS_KEY_ID}
    aws_secret_access_key = ${AWS_PROD_SECRET_ACCESS_KEY}
    region = us-east-1
    
    [staging]
    aws_access_key_id = ${AWS_STAGING_ACCESS_KEY_ID}
    aws_secret_access_key = ${AWS_STAGING_SECRET_ACCESS_KEY}
    region = us-west-2
---
apiVersion: v1
kind: Secret
metadata:
  name: aws-provider-staging-creds
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: crossplane-aws-staging-credentials
type: Opaque
stringData:
  credentials: |
    [default]
    aws_access_key_id = ${AWS_STAGING_ACCESS_KEY_ID}
    aws_secret_access_key = ${AWS_STAGING_SECRET_ACCESS_KEY}
    region = us-west-2
---
apiVersion: v1
kind: Secret
metadata:
  name: aws-provider-standby-creds
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: crossplane-aws-standby-credentials
type: Opaque
stringData:
  credentials: |
    [default]
    aws_access_key_id = ${AWS_STANDBY_ACCESS_KEY_ID}
    aws_secret_access_key = ${AWS_STANDBY_SECRET_ACCESS_KEY}
    region = eu-west-1
---
apiVersion: aws.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: aws-default
  namespace: crossplane-system
  labels:
    environment: production
    region: us-east-1
  annotations:
    description: "Configuración default del provider de AWS para recursos de producción"
    owner: "plataforma-infraestructura"
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: aws-provider-creds
      key: credentials
  region: us-east-1
  skipCredentialsValidation: false
  skipRequestingAccountId: false
  useAWSStackIDFleet: false
  endpoints:
    - name: rds
      endpoint: https://rds.us-east-1.amazonaws.com
      services:
        - RDS
    - name: s3
      endpoint: https://s3.us-east-1.amazonaws.com
      services:
        - S3
    - name: iam
      endpoint: https://iam.us-east-1.amazonaws.com
      services:
        - IAM
    - name: eks
      endpoint: https://eks.us-east-1.amazonaws.com
      services:
        - EKS
    - name: ec2
      endpoint: https://ec2.us-east-1.amazonaws.com
      services:
        - EC2
    - name: elasticache
      endpoint: https://elasticache.us-east-1.amazonaws.com
      services:
        - ElastiCache
    - name: secretsmanager
      endpoint: https://secretsmanager.us-east-1.amazonaws.com
      services:
        - SecretsManager
---
apiVersion: aws.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: aws-staging
  namespace: crossplane-system
  labels:
    environment: staging
    region: us-west-2
  annotations:
    description: "Configuración del provider de AWS para recursos de staging"
    owner: "plataforma-infraestructura"
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: aws-provider-staging-creds
      key: credentials
  region: us-west-2
  skipCredentialsValidation: false
  skipRequestingAccountId: false
---
apiVersion: aws.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: aws-standby
  namespace: crossplane-system
  labels:
    environment: disaster-recovery
    region: eu-west-1
  annotations:
    description: "Configuración del provider de AWS para recursos de standby/disaster recovery"
    owner: "plataforma-infraestructura"
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: aws-provider-standby-creds
      key: credentials
  region: eu-west-1
  skipCredentialsValidation: false
  skipRequestingAccountId: false
---
apiVersion: pkg.crossplane.io/v1
kind: ProviderRevision
metadata:
  name: provider-aws-rev-0
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: provider-aws-revision
    provider: provider-aws
spec:
  desiredState: alive
  revision: 0
  providerReference:
    name: provider-aws
    namespace: crossplane-system
---
apiVersion: pkg.crossplane.io/v1
kind: Lock
metadata:
  name: crossplane-lock
  namespace: crossplane-system
locks:
  - configRefs:
      - name: aws-controller-config
    dependencies:
      - package: xpkg.upbound.io/upbound/provider-aws:v0.47.0
        version: v0.47.0
    revisionRefs:
      - name: provider-aws-rev-0
// === ARCHIVO: manifests/crossplane/compositions.yaml ===
apiVersion: apiextensions.crossplane.io/v1
kind: CompositeResourceDefinition
metadata:
  name: xdatabases.rds.fintech.internal
  labels:
    app.kubernetes.io/name: xdatabase
    app.kubernetes.io/part-of: crossplane
    category: database
  annotations:
    description: "Definición de recurso compuesto para bases de datos RDS PostgreSQL/MySQL"
    owner: "plataforma-infraestructura"
    documentation: "https://docs.crossplane.io/v1.14/concepts/composition/"
spec:
  group: rds.fintech.internal
  names:
    kind: XDatabase
    plural: xdatabases
  versions:
    - name: v1alpha1
      served: true
      referenceable: true
    - name: v1beta1
      served: true
      referenceable: false
  claimNames:
    kind: DatabaseClaim
    plural: databaseclaims
---
apiVersion: apiextensions.crossplane.io/v1
kind: CompositeResourceDefinition
metadata:
  name: xbuckets.s3.fintech.internal
  labels:
    app.kubernetes.io/name: xbucket
    app.kubernetes.io/part-of: crossplane
    category: storage
  annotations:
    description: "Definición de recurso compuesto para buckets S3"
    owner: "plataforma-infraestructura"
    documentation: "https://docs.crossplane.io/v1.14/concepts/composition/"
spec:
  group: s3.fintech.internal
  names:
    kind: XBucket
    plural: xbuckets
  versions:
    - name: v1alpha1
      served: true
      referenceable: true
    - name: v1beta1
      served: true
      referenceable: false
  claimNames:
    kind: BucketClaim
    plural: bucketclaims
---
apiVersion: apiextensions.crossplane.io/v1
kind: CompositeResourceDefinition
metadata:
  name: xiamroles.iam.fintech.internal
  labels:
    app.kubernetes.io/name: xiamrole
    app.kubernetes.io/part-of: crossplane
    category: security
  annotations:
    description: "Definición de recurso compuesto para roles IAM"
    owner: "plataforma-infraestructura"
    documentation: "https://docs.crossplane.io/v1.14/concepts/composition/"
spec:
  group: iam.fintech.internal
  names:
    kind: XIAMRole
    plural: xiamroles
  versions:
    - name: v1alpha1
      served: true
      referenceable: true
    - name: v1beta1
      served: true
      referenceable: false
  claimNames:
    kind: IAMRoleClaim
    plural: iamroleclaims
---
apiVersion: apiextensions.crossplane.io/v1
kind: CompositeResourceDefinition
metadata:
  name: xredis.elasticache.fintech.internal
  labels:
    app.kubernetes.io/name: xredis
    app.kubernetes.io/part-of: crossplane
    category: cache
  annotations:
    description: "Definición de recurso compuesto para clusters ElastiCache Redis"
    owner: "plataforma-infraestructura"
    documentation: "https://docs.crossplane.io/v1.14/concepts/composition/"
spec:
  group: elasticache.fintech.internal
  names:
    kind: XRedis
    plural: xredises
  versions:
    - name: v1alpha1
      served: true
      referenceable: true
    - name: v1beta1
      served: true
      referenceable: false
  claimNames:
    kind: RedisClaim
    plural: redisclaims
---
apiVersion: apiextensions.crossplane.io/v1
kind: CompositeResourceDefinition
metadata:
  name: xsecrets.secretsmanager.fintech.internal
  labels:
    app.kubernetes.io/name: xsecret
    app.kubernetes.io/part-of: crossplane
    category: security
  annotations:
    description: "Definición de recurso compuesto para secrets en AWS Secrets Manager"
    owner: "plataforma-infraestructura"
    documentation: "https://docs.crossplane.io/v1.14/concepts/composition/"
spec:
  group: secretsmanager.fintech.internal
  names:
    kind: XSecret
    plural: xsecrets
  versions:
    - name: v1alpha1
      served: true
      referenceable: true
    - name: v1beta1
      served: true
      referenceable: false
  claimNames:
    kind: SecretClaim
    plural: secretclaims
---
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata:
  name: database.rds.postgresql.fintech.internal
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: composition-postgresql
    provider: aws
    type: database
  annotations:
    description: "Composición para crear instancias RDS PostgreSQL de alta disponibilidad"
    owner: "plataforma-infraestructura"
    composition.apiextensions.crossplane.io/writeConnectionSecrets: "true"
spec:
  writeConnectionSecrets: true
  compositeTypeRef:
    apiVersion: rds.fintech.internal/v1alpha1
    kind: XDatabase
  patchSets:
    - name: common-labels
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.labels
          toFieldPath: metadata.labels
        - type: FromCompositeFieldPath
          fromFieldPath: spec.region
          toFieldPath: spec.forProvider.region
          transforms:
            - type: string
              string:
                fmt: "%s"
    - name: tags
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: spec.tags
          toFieldPath: spec.forProvider.tags
            
  resources:
    - name: dbSubnetGroup
      base:
        apiVersion: aws.upbound.io/v1beta1
        kind: RDSSubnetGroup
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            description: "Subnet group para RDS PostgreSQL"
            tags:
              Environment: production
              ManagedBy: Crossplane
          providerConfigRef:
            name: aws-default
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-subnet-group"
        - type: FromCompositeFieldPath
          fromFieldPath: spec.vpcId
          toFieldPath: spec.forProvider.vpcId
        - type: FromCompositeFieldPath
          fromFieldPath: spec.subnetIds
          toFieldPath: spec.forProvider.subnetIdSelector.matchLabels
          policy:
            fromFieldPath: Required
    
    - name: dbSecurityGroup
      base:
        apiVersion: ec2.upbound.io/v1beta1
        kind: SecurityGroup
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            description: "Security group para RDS PostgreSQL"
            ingress:
              - fromPort: 5432
                toPort: 5432
                protocol: tcp
                cidrBlocks:
                  - 10.0.0.0/8
              - fromPort: 5432
                toPort: 5432
                protocol: tcp
                ipv6CidrBlocks:
                  - ::/0
            tags:
              Environment: production
              ManagedBy: Crossplane
          providerConfigRef:
            name: aws-default
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-sg"
        - type: FromCompositeFieldPath
          fromFieldPath: spec.vpcId
          toFieldPath: spec.forProvider.vpcIdSelector.matchLabels
          policy:
            fromFieldPath: Required
    
    - name: dbInstance
      base:
        apiVersion: rds.upbound.io/v1beta1
        kind: Instance
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            engine: postgres
            engineVersion: "15.4"
            instanceClass: db.t3.medium
            allocatedStorage: 100
            maxAllocatedStorage: 500
            storageType: gp3
            storageEncrypted: true
            multiAz: true
            dbName: fintechdb
            username: dbadmin
            publiclyAccessible: false
            vpcSecurityGroupIdSelector:
              matchLabels:
                app.kubernetes.io/managed-by: crossplane
            dbSubnetGroupNameSelector:
              matchLabels:
                app.kubernetes.io/managed-by: crossplane
            backupRetentionPeriod: 7
            copyTagsToSnapshot: true
            deletionProtection: true
            skipFinalSnapshot: false
            finalDbSnapshotIdentifier: "{{ .metadata.name }}-final-snapshot"
            enabledCloudwatchLogsExports:
              - postgresql
              - upgrade
            performanceInsightsEnabled: true
            performanceInsightsKmsKeyIdSelector:
              matchLabels:
                type: kms-key
            monitoringInterval: 60
            monitoringRoleArnSelector:
              matchLabels:
                type: rds-monitoring-role
            autoMinorVersionUpgrade: true
            maintenanceWindow: "mon:03:00-mon:04:00"
            backupWindow: "02:00-03:00"
            tags:
              Environment: production
              ManagedBy: Crossplane
              Project: fintech-platform
          providerConfigRef:
            name: aws-default
          writeConnectionSecretToRef:
            namespace: crossplane-system
            prefix: db-
      connectionDetails:
        - fromConnectionSecretKey: endpoint
          name: endpoint
        - fromConnectionSecretKey: port
          name: port
        - fromConnectionSecretKey: username
          name: username
        - fromConnectionSecretKey: password
          name: password
        - fromConnectionSecretKey: dbname
          name: dbname
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-postgres"
        - type: FromCompositeFieldPath
          fromFieldPath: spec.engineVersion
          toFieldPath: spec.forProvider.engineVersion
        - type: FromCompositeFieldPath
          fromFieldPath: spec.instanceClass
          toFieldPath: spec.forProvider.instanceClass
        - type: FromCompositeFieldPath
          fromFieldPath: spec.allocatedStorage
          toFieldPath: spec.forProvider.allocatedStorage
        - type: FromCompositeFieldPath
          fromFieldPath: spec.multiAz
          toFieldPath: spec.forProvider.multiAz
        - type: FromCompositeFieldPath
          fromFieldPath: spec.backupRetentionDays
          toFieldPath: spec.forProvider.backupRetentionPeriod
        - type: FromCompositeFieldPath
          fromFieldPath: spec.deletionProtection
          toFieldPath: spec.forProvider.deletionProtection
      readinessChecks:
        - type: ConnectionCheck
          fieldPath: status.atProvider.endpoint
        - type: CheckAvailable
          fieldPath: status.atProvider.dbInstanceStatus
---
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata:
  name: bucket.s3.standard.fintech.internal
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: composition-s3-bucket
    provider: aws
    type: storage
  annotations:
    description: "Composición para crear buckets S3 con configuración de seguridad"
    owner: "plataforma-infraestructura"
    composition.apiextensions.crossplane.io/writeConnectionSecrets: "true"
spec:
  writeConnectionSecrets: true
  compositeTypeRef:
    apiVersion: s3.fintech.internal/v1alpha1
    kind: XBucket
  resources:
    - name: s3Bucket
      base:
        apiVersion: s3.upbound.io/v1beta1
        kind: Bucket
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            accelerationStatus: Suspended
            acl: private
            corsRule: []
            lifecycleRule: []
            logging: []
            objectLockEnabled: false
            objectOwnership: BucketOwnerEnforced
            serverSideEncryptionConfiguration:
              - rule:
                  applyServerSideEncryptionByDefault:
                    sseAlgorithm: AES256
            tags:
              Environment: production
              ManagedBy: Crossplane
              Project: fintech-platform
            versioning:
              enabled: true
              mfaDelete: Disabled
            website: []
          providerConfigRef:
            name: aws-default
          writeConnectionSecretToRef:
            namespace: crossplane-system
            prefix: s3-
      connectionDetails:
        - fromConnectionSecretKey: bucket-name
          name: bucketName
        - fromConnectionSecretKey: bucket-region
          name: bucketRegion
        - fromConnectionSecretKey: bucketArn
          name: bucketArn
        - fromConnectionSecretKey: bucketDomainName
          name: bucketDomainName
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
        - type: FromCompositeFieldPath
          fromFieldPath: spec.region
          toFieldPath: spec.forProvider.region
        - type: FromCompositeFieldPath
          fromFieldPath: spec.versioningEnabled
          toFieldPath: spec.forProvider.versioning[0].enabled
    
    - name: bucketPolicy
      base:
        apiVersion: s3.upbound.io/v1beta1
        kind: BucketPolicy
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            bucketSelector:
              matchLabels:
                app.kubernetes.io/managed-by: crossplane
            policy: |
              {
                "Version": "2012-10-17",
                "Statement": [
                  {
                    "Sid": "DenyIncorrectEncryptionHeader",
                    "Effect": "Deny",
                    "Principal": "*",
                    "Action": "s3:PutObject",
                    "Resource": "arn:aws:s3:::*/*",
                    "Condition": {
                      "StringNotEquals": {
                        "s3:x-amz-server-side-encryption": "AES256"
                      }
                    }
                  },
                  {
                    "Sid": "DenyUnEncryptedObjectUploads",
                    "Effect": "Deny",
                    "Principal": "*",
                    "Action": "s3:PutObject",
                    "Resource": "arn:aws:s3:::*/*",
                    "Condition": {
                      "Bool": {
                        "s3:PutObjectServerSideEncryption": "false"
                      }
                    }
                  }
                ]
              }
          providerConfigRef:
            name: aws-default
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-policy"
---
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata:
  name: iamrole.standard.fintech.internal
  namespace: crossplane-system
  labels:
    app.kubernetes.io/name: composition-iam-role
    provider: aws
    type: security
  annotations:
    description: "Composición para crear roles IAM con políticas asociadas"
    owner: "plataforma-infraestructura"
    composition.apiextensions.crossplane.io/writeConnectionSecrets: "true"
spec:
  writeConnectionSecrets: true
  compositeTypeRef:
    apiVersion: iam.fintech.internal/v1alpha1
    kind: XIAMRole
  resources:
    - name: iamRole
      base:
        apiVersion: iam.upbound.io/v1beta1
        kind: Role
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            name: ""
            assumeRolePolicy: |
              {
                "Version": "2012-10-17",
                "Statement": [
                  {
                    "Effect": "Allow",
                    "Principal": {
                      "Service": ["eks.amazonaws.com", "ec2.amazonaws.com"]
                    },
                    "Action": "sts:AssumeRole"
                  }
                ]
              }
            forceDetach: true
            maxSessionDuration: 3600
            permissionsBoundary: ""
            tags:
              Environment: production
              ManagedBy: Crossplane
              Project: fintech-platform
          providerConfigRef:
            name: aws-default
          writeConnectionSecretToRef:
            namespace: crossplane-system
            prefix: iam-role-
      connectionDetails:
        - fromConnectionSecretKey: role-arn
          name: roleArn
        - fromConnectionSecretKey: role-name
          name: roleName
        - fromConnectionSecretKey: role-id
          name: roleId
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-role"
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: spec.forProvider.name
          transforms:
            - type: string
              string:
                fmt: "%s-role"
        - type: FromCompositeFieldPath
          fromFieldPath: spec.assumeRolePolicy
          toFieldPath: spec.forProvider.assumeRolePolicy
        - type: FromCompositeFieldPath
          fromFieldPath: spec.permissionsBoundary
          toFieldPath: spec.forProvider.permissionsBoundary
    
    - name: iamPolicy
      base:
        apiVersion: iam.upbound.io/v1beta1
        kind: Policy
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            name: ""
            description: "Política generada por Crossplane para rol de fintech"
            policy: |
              {
                "Version": "2012-10-17",
                "Statement": []
              }
            tags:
              Environment: production
              ManagedBy: Crossplane
              Project: fintech-platform
          providerConfigRef:
            name: aws-default
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-policy"
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: spec.forProvider.name
          transforms:
            - type: string
              string:
                fmt: "%s-policy"
        - type: FromCompositeFieldPath
          fromFieldPath: spec.policy
          toFieldPath: spec.forProvider.policy
    
    - name: rolePolicyAttachment
      base:
        apiVersion: iam.upbound.io/v1beta1
        kind: RolePolicyAttachment
        metadata:
          name: ""
          labels:
            app.kubernetes.io/managed-by: crossplane
        spec:
          forProvider:
            region: us-east-1
            roleNameSelector:
              matchLabels:
                app.kubernetes.io/managed-by: crossplane
            policyArnSelector:
              matchLabels:
                app.kubernetes.io/managed-by: crossplane
          providerConfigRef:
            name: aws-default
      patches:
        - type: FromCompositeFieldPath
          fromFieldPath: metadata.name
          toFieldPath: metadata.name
          transforms:
            - type: string
              string:
                fmt: "%s-attachment"


// === ARCHIVO: manifests/vault/config.hcl ===
# Configuration de Vault para almacenamiento de secrets con replicación cross-region
# Arquitectura: 3 nodos Vault en modo HA con almacenamiento Raft
# Regiones: us-east-1 (primary), us-west-2 (replica1), eu-west-1 (replica2)

ui = true

cluster_addr = "https://{{ vault_addr }}:8201"

storage "raft" {
  path = "/vault/data"
  
  retry_join {
    leader_api_addr = "https://vault-primary.us-east-1.fintech.internal:8200"
    leader_ca_cert_file = "/vault/tls/ca.crt"
    leader_client_cert_file = "/vault/tls/vault.crt"
    leader_client_key_file = "/vault/tls/vault.key"
  }
  
  retry_join {
    leader_api_addr = "https://vault-replica1.us-west-2.fintech.internal:8200"
    leader_ca_cert_file = "/vault/tls/ca.crt"
    leader_client_cert_file = "/vault/tls/vault.crt"
    leader_client_key_file = "/vault/tls/vault.key"
  }
  
  retry_join {
    leader_api_addr = "https://vault-replica2.eu-west-1.fintech.internal:8200"
    leader_ca_cert_file = "/vault/tls/ca.crt"
    leader_client_cert_file = "/vault/tls/vault.crt"
    leader_client_key_file = "/vault/tls/vault.key"
  }
  
  snapshot_interval = "30m"
  autopilot = true
}

listener "tcp" {
  address = "[::]:8200"
  cluster_address = "[::]:8201"
  
  tls_cert_file = "/vault/tls/vault.crt"
  tls_key_file = "/vault/tls/vault.key"
  tls_client_ca_file = "/vault/tls/ca.crt"
  
  tls_min_version = "tls12"
  tls_require_and_verify_client_cert = true
  
  proxy_protocol_behavior = "allow_authorized"
  
  http_response_headers {
    "Strict-Transport-Security" = "max-age=31536000; includeSubDomains"
    "X-Content-Type-Options" = "nosniff"
    "X-Frame-Options" = "DENY"
    "Content-Security-Policy" = "default-src 'none'; script-src 'self'; style-src 'self' 'unsafe-inline'"
  }
}

telemetry {
  prometheus_retention_time = "30s"
  disable_hostname = false
  
  prometheus = true
  
  dogstatsd_addr = "dogstatsd.internal.fintech.internal:8125"
  dogstatsd_tags = ["env:production", "region:us-east-1", "cluster:vault-ha"]
}

service_registration "kubernetes" {
  namespace = "vault"
  pod_name = "vault-"
  pod_namespace = "vault"
  
  k8s_service_account_name = "vault"
  k8s_service_account_namespace = "vault"
}

seal "awskms" {
  region = "us-east-1"
  kms_key_id = "alias/vault-unseal-key"
  
  endpoint = "https://kms.us-east-1.amazonaws.com"
  
  session_name = "vault-kms-session"
}

max_request_duration = "90s"

default_max_request_duration = "90s"

disable_mlock = false

api_addr = "https://vault-primary.us-east-1.fintech.internal:8200"

cluster_name = "fintech-vault-cluster"

disable_printable_check = true

entropy "entropy" {
  mode = "augmentation"
  seed = ""
}

// === Configuración de replicación cross-region ===

// Réplica de escritura en us-west-2
// Habilitar DR replication para failover automático

// Configuración de políticas de audit
audit "file" {
  path = "/vault/audit/vault-audit.log"
  log_raw = true
  
  hmac_accessor = true
  
  log_raw = false
  
  format = "json"
  
  prefix = ""
}

// Configuración de políticas de rate limiting
ratelimit = "1000rps"

// Configuración de logging
log_level = "INFO"

// Configuración de expiry
default_lease_ttl = "24h"
max_lease_ttl = "8760h"

// Configuración de plugins
plugin_directory = "/vault/plugins"

// Configuración de HA
ha {
  backend = "raft"
  
  disable_clustering = false
  
  redirect_addr = "https://vault-primary.us-east-1.fintech.internal:8200"
}

// === Políticas específicas para el cluster ===

// Política para secretos de aplicación
path "secret/data/apps/*" {
  capabilities = ["read", "list", "create", "update", "delete"]
}

// Política para secretos de base de datos
path "secret/data/databases/*" {
  capabilities = ["read", "list", "create", "update", "delete"]
}

// Política para credenciales AWS
path "secret/data/aws/*" {
  capabilities = ["read", "list", "create", "update", "delete"]
}

// Política para certificados TLS
path "secret/data/tls/*" {
  capabilities = ["read", "list", "create", "update", "delete"]
}

// Política para claves de API externas
path "secret/data/external-apis/*" {
  capabilities = ["read", "list", "create", "update", "delete"]
}

// Política de lectura para métricas
path "sys/metrics*" {
  capabilities = ["read"]
}

// Política de salud del cluster
path "sys/health*" {
  capabilities = ["read", "update"]
}

// Políticas de autenticación
auth "kubernetes" {
  kubernetes_host = "https://kubernetes.default.svc"
  
  kubernetes_ca_cert = "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
  
  token_reviewer_jwt = ""
  
  pem_keys = []
  
  bound_service_account_names = ["vault", "vault-auth", "external-secrets"]
  
  bound_service_account_namespaces = ["vault", "external-secrets", "argocd", "apps"]
  
  audience = "vault"
  
  token_ttl = "24h"
  
  token_max_ttl = "48h"
  
  token_policies = ["default", "k8s-auth-policy"]
}

// Configuración de autenticación AWS IAM
auth "aws" {
  access_key = ""
  secret_key = ""
  
  region = "us-east-1"
  
  iam_server_id_header_value = "vault.fintech.internal"
  
  allowed_sts_endpoint = ["sts.amazonaws.com", "sts.us-east-1.amazonaws.com", "sts.eu-west-1.amazonaws.com", "sts.us-west-2.amazonaws.com"]
  
  ec2_aliases {
    us-east-1 = "ec2.us-east-1.fintech.internal"
    us-west-2 = "ec2.us-west-2.fintech.internal"
    eu-west-1 = "ec2.eu-west-1.fintech.internal"
  }
}

// Configuración de transit para cifrado de datos
// === ARCHIVO: manifests/external-secrets/secret-store.yaml ===
# Configuración de External Secrets Operator para sincronización de secrets desde Vault a clusters
# Namespace: external-secrets
# Proveedor: HashiCorp Vault
# Replicación: Multi-region con failover automático

apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: fintech-vault-cluster-store
  namespace: external-secrets
  annotations:
    description: "Secret Store centralizado para acceso a Vault desde todos los clusters"
    maintainer: "fintech-architecture@fintech.internal"
    replication.strategy: "cross-region"
    monitoring.fintech.internal/enabled: "true"
spec:
  provider:
    vault:
      server: "https://vault-primary.us-east-1.fintech.internal:8200"
      
      path: "secret"
      
      version: "v2"
      
      caProvider:
        type: "Secret"
        name: "vault-ca-cert"
        namespace: "vault"
        key: "ca.crt"
      
      auth:
        kubernetes:
          mountPath: "kubernetes"
          
          role: "external-secrets-sync"
          
          serviceAccountRef:
            name: "external-secrets"
            namespace: "external-secrets"
      
        # Configuración de failover: si el servidor primary falla, usar réplicas
        # Retry configuration para resiliencia
        retrySettings:
          maxRetries: 5
          
          retryInterval: "60s"
          
          retryTimeout: "180s"
      
      # Headers personalizados para mTLS
      headers:
        X-Vault-Namespace: "fintech-prod"
        
        X-Vault-Token: ""
      
      # Configuración de cache para mejorar rendimiento
      cache:
        enabled: true
        
        ttl: 3600
      
      # Versionado de secrets
      enableVaultV2: true
      
      # Prefijo de path para organización
      prefix: "secret/data"
---
# Secret Store adicional para cada región (fallback)
apiVersion: external-secrets.io/v1beta1
kind: SecretStore
metadata:
  name: fintech-vault-us-west-2
  namespace: external-secrets
  annotations:
    description: "Secret Store para región us-west-2 (failover)"
    region: "us-west-2"
    priority: "1"
spec:
  provider:
    vault:
      server: "https://vault-replica1.us-west-2.fintech.internal:8200"
      
      path: "secret"
      
      version: "v2"
      
      caProvider:
        type: "Secret"
        name: "vault-ca-cert"
        namespace: "vault"
        key: "ca.crt"
      
      auth:
        kubernetes:
          mountPath: "kubernetes"
          
          role: "external-secrets-sync"
          
          serviceAccountRef:
            name: "external-secrets"
            namespace: "external-secrets"
      
      retrySettings:
        maxRetries: 3
        
        retryInterval: "30s"
        
        retryTimeout: "120s"
      
      enableVaultV2: true
      
      prefix: "secret/data"
---
apiVersion: external-secrets.io/v1beta1
kind: SecretStore
metadata:
  name: fintech-vault-eu-west-1
  namespace: external-secrets
  annotations:
    description: "Secret Store para región eu-west-1 (failover)"
    region: "eu-west-1"
    priority: "1"
spec:
  provider:
    vault:
      server: "https://vault-replica2.eu-west-1.fintech.internal:8200"
      
      path: "secret"
      
      version: "v2"
      
      caProvider:
        type: "Secret"
        name: "vault-ca-cert"
        namespace: "vault"
        key: "ca.crt"
      
      auth:
        kubernetes:
          mountPath: "kubernetes"
          
          role: "external-secrets-sync"
          
          serviceAccountRef:
            name: "external-secrets"
            namespace: "external-secrets"
      
      retrySettings:
        maxRetries: 3
        
        retryInterval: "30s"
        
        retryTimeout: "120s"
      
      enableVaultV2: true
      
      prefix: "secret/data"
---
# Namespace scoped store para aplicaciones que requieren isolation
apiVersion: external-secrets.io/v1beta1
kind: SecretStore
metadata:
  name: fintech-app-secure-store
  namespace: apps
  annotations:
    description: "Secret Store dedicado para namespace apps con isolation"
    isolation: "strict"
spec:
  provider:
    vault:
      server: "https://vault-primary.us-east-1.fintech.internal:8200"
      
      path: "secret"
      
      version: "v2"
      
      caProvider:
        type: "Secret"
        name: "vault-ca-cert"
        namespace: "vault"
        key: "ca.crt"
      
      auth:
        kubernetes:
          mountPath: "kubernetes"
          
          role: "app-secrets-reader"
          
          serviceAccountRef:
            name: "app-sa"
            namespace: "apps"
      
      # Limitación de acceso solo a secrets específicos de la app
      conditions:
        - expressions:
            - key: "secret/data/apps/*"
      
      enableVaultV2: true
      
      prefix: "secret/data"
---
# Store para credenciales de base de datos con rotación automática
apiVersion: external-secrets.io/v1beta1
kind: SecretStore
metadata:
  name: fintech-db-credentials
  namespace: databases
  annotations:
    description: "Secret Store para rotación automática de credenciales de base de datos"
    rotation.enabled: "true"
    rotation.interval: "24h"
spec:
  provider:
    vault:
      server: "https://vault-primary.us-east-1.fintech.internal:8200"
      
      path: "secret"
      
      version: "v2"
      
      caProvider:
        type: "Secret"
        name: "vault-ca-cert"
        namespace: "vault"
        key: "ca.crt"
      
      auth:
        kubernetes:
          mountPath: "kubernetes"
          
          role: "db-secrets-manager"
          
          serviceAccountRef:
            name: "db-rotator-sa"
            namespace: "databases"
      
      enableVaultV2: true
      
      prefix: "secret/data"
---
# Configuración de PushSecret para sincronización inversa (clusters -> Vault)
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: fintech-vault-push-store
  namespace: external-secrets
  annotations:
    description: "Secret Store para push de secrets desde clusters a Vault"
    direction: "push"
spec:
  provider:
    vault:
      server: "https://vault-primary.us-east-1.fintech.internal:8200"
      
      path: "secret"
      
      version: "v2"
      
      caProvider:
        type: "Secret"
        name: "vault-ca-cert"
        namespace: "vault"
        key: "ca.crt"
      
      auth:
        kubernetes:
          mountPath: "kubernetes"
          
          role: "external-secrets-pusher"
          
          serviceAccountRef:
            name: "external-secrets-push"
            namespace: "external-secrets"
      
      enableVaultV2: true
      
      prefix: "secret/data"
---
# === ARCHIVO: manifests/rbac/cluster-role.yaml ===
# Definición de roles federados para gestión centralizada de permisos en entorno multi-cluster
# Arquitectura: ClusterRole con agregación de etiquetas para permisos granulares
# Clusters: primary (us-east-1), standby-1 (us-west-2), standby-2 (eu-west-1)
#
# Notas de diseño:
# - Uso de aggregationRule para permitir extensión mediante ClusterRole con etiquetas matching
# - Separación de permisos por componente del sistema
# - Principio de menor privilegio aplicado
# - Soporte para disaster recovery con permisos de failover

---
# ClusterRole base para lectores del sistema (todos los componentes)
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-readonly
  annotations:
    description: "Rol base de solo lectura para usuarios y servicios de monitoreo"
    rbac.fintech.internal/aggregation: "readonly"
    audit.fintech.internal/loggable: "true"
spec:
  aggregationRule:
    clusterRoleSelectors:
      - matchLabels:
          rbac.fintech.internal/aggregate-to-readonly: "true"
  rules: []
---
# ClusterRole para administradores de ArgoCD
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-argocd-admin
  annotations:
    description: "Administración completa de ArgoCD y aplicaciones GitOps"
    component: "argocd"
    rbac.fintech.internal/aggregation: "argocd"
    audit.fintech.internal/loggable: "true"
rules:
  - apiGroups: ["argoproj.io"]
    resources:
      - applications
      - applicationsets
      - appprojects
      - applicationsets/finalizers
      - applications/finalizers
    verbs: ["*"]
  
  - apiGroups: [""]
    resources:
      - configmaps
      - secrets
      - services
      - pods
      - pods/log
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["apps"]
    resources:
      - deployments
      - statefulsets
      - daemonsets
    verbs: ["get", "list", "watch", "update", "patch"]
  
  - apiGroups: [""]
    resources:
      - namespaces
    verbs: ["get", "list"]
  
  - apiGroups: ["rbac.authorization.k8s.io"]
    resources:
      - rolebindings
      - roles
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["networking.k8s.io"]
    resources:
      - ingresses
      - networkpolicies
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  
  - apiGroups: ["autoscaling"]
    resources:
      - horizontalpodautoscalers
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
---
# ClusterRole para administradores de Crossplane
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-crossplane-admin
  annotations:
    description: "Administración de recursos aprovisionados por Crossplane"
    component: "crossplane"
    rbac.fintech.internal/aggregation: "crossplane"
    audit.fintech.internal/loggable: "true"
rules:
  - apiGroups: ["apiextensions.crossplane.io"]
    resources: ["compositions", "compositions/finalizers", "compositeresourcedefinitions", "compositeresourcedefinitions/finalizers"]
    verbs: ["*"]
  
  - apiGroups: ["pkg.crossplane.io"]
    resources: ["providerrevisions", "configurationrevisions", "providers", "configurations"]
    verbs: ["*"]
  
  - apiGroups: ["crossplane.io"]
    resources:
      - compositemissingresources
      - compositeresources
      - claims
      - xrdetails
      - usagemissingresources
      - usages
    verbs: ["*"]
  
  - apiGroups: ["aws.fintech.internal"]
    resources: ["*"]
    verbs: ["*"]
  
  - apiGroups: ["aws.upbound.io"]
    resources: ["*"]
    verbs: ["*"]
  
  - apiGroups: [""]
    resources:
      - namespaces
      - persistentvolumes
      - persistentvolumeclaims
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  
  - apiGroups: ["storage.k8s.io"]
    resources:
      - storageclasses
      - csidinodes
      - csinodes
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["networking.k8s.io"]
    resources:
      - ingressclasses
    verbs: ["get", "list", "watch"]
---
# ClusterRole para administradores de External Secrets
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-external-secrets-admin
  annotations:
    description: "Administración de External Secrets Operator y sincronización de Vault"
    component: "external-secrets"
    rbac.fintech.internal/aggregation: "external-secrets"
    audit.fintech.internal/loggable: "true"
rules:
  - apiGroups: ["external-secrets.io"]
    resources:
      - clustersecretstores
      - secretstores
      - externalsecrets
      - externalsecrets/finalizers
      - externalsecrets/status
      - pushsecrets
      - pushsecrets/finalizers
      - pushsecrets/status
      - generatesecrets
      - clustergeneratesecrets
      - acmecertificates
    verbs: ["*"]
  
  - apiGroups: [""]
    resources:
      - secrets
      - configmaps
    verbs: ["*"]
  
  - apiGroups: [""]
    resources:
      - serviceaccounts
      - serviceaccounts/token
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  
  - apiGroups: ["authentication.k8s.io"]
    resources:
      - tokenreviews
    verbs: ["create"]
  
  - apiGroups: ["authorization.k8s.io"]
    resources:
      - subjectaccessreviews
    verbs: ["create"]
---
# ClusterRole para controladores de Disaster Recovery
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-disaster-recovery-admin
  annotations:
    description: "Permisos para lógica de failover y recuperación ante desastres"
    component: "disaster-recovery"
    rbac.fintech.internal/aggregation: "disaster-recovery"
    audit.fintech.internal/loggable: "true"
    criticality: "high"
rules:
  - apiGroups: ["disaster-recovery.fintech.internal"]
    resources:
      - failoverplans
      - failoverplans/finalizers
      - failoverplans/status
      - failoverexecutions
      - failoverexecutions/finalizers
      - failoverexecutions/status
      - clusterhealths
      - clusterhealths/status
    verbs: ["*"]
  
  - apiGroups: ["argoproj.io"]
    resources:
      - applications
      - applicationsets
    verbs: ["get", "list", "watch", "update", "patch"]
  
  - apiGroups: [""]
    resources:
      - namespaces
    verbs: ["get", "list", "watch"]
  
  - apiGroups: [""]
    resources:
      - pods
      - services
      - endpoints
      - configmaps
      - secrets
    verbs: ["get", "list", "watch", "update", "patch", "delete", "create"]
  
  - apiGroups: ["apps"]
    resources:
      - deployments
      - statefulsets
      - replicasets
    verbs: ["get", "list", "watch", "update", "patch", "delete"]
  
  - apiGroups: ["networking.k8s.io"]
    resources:
      - ingresses
      - services
    verbs: ["get", "list", "watch", "update", "patch", "delete", "create"]
  
  - apiGroups: ["rbac.authorization.k8s.io"]
    resources:
      - clusterrolebindings
      - clusterroles
    verbs: ["get", "list", "watch", "update", "patch"]
  
  - apiGroups: ["coordination.k8s.io"]
    resources:
      - leases
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  
  - apiGroups: [""]
    resources:
      - events
    verbs: ["get", "list", "watch", "create", "update", "patch"]
---
# ClusterRole para operadores de infraestructura
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-infrastructure-operator
  annotations:
    description: "Permisos para gestión de infraestructura base (networking, storage, DNS)"
    component: "infrastructure"
    rbac.fintech.internal/aggregation: "infrastructure"
    audit.fintech.internal/loggable: "true"
rules:
  - apiGroups: ["networking.k8s.io"]
    resources:
      - networkpolicies
      - ingressclasses
      - ingresses
    verbs: ["*"]
  
  - apiGroups: ["networking.k8s.io"]
    resources:
      - services
    verbs: ["*"]
  
  - apiGroups: ["storage.k8s.io"]
    resources:
      - storageclasses
      - csidrivers
      - csinodes
    verbs: ["*"]
  
  - apiGroups: [""]
    resources:
      - persistentvolumes
      - persistentvolumeclaims
    verbs: ["*"]
  
  - apiGroups: ["rbac.authorization.k8s.io"]
    resources:
      - clusterroles
      - clusterrolebindings
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["policy"]
    resources:
      - poddisruptionbudgets
    verbs: ["*"]
---
# ClusterRole para métricas y monitoreo
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-metrics-reader
  annotations:
    description: "Acceso de lectura a métricas del cluster para Prometheus y Grafana"
    component: "monitoring"
    rbac.fintech.internal/aggregation: "monitoring"
    audit.fintech.internal/loggable: "false"
rules:
  - apiGroups: ["metrics.k8s.io"]
    resources:
      - pods
      - pods/log
      - nodes
    verbs: ["get", "list", "watch"]
  
  - apiGroups: [""]
    resources:
      - pods
      - pods/log
      - services
      - endpoints
      - nodes
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["autoscaling"]
    resources:
      - horizontalpodautoscalers
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["batch"]
    resources:
      - jobs
      - cronjobs
    verbs: ["get", "list", "watch"]
  
  - apiGroups: ["apps"]
    resources:
      - deployments
      - statefulsets
      - daemonsets
      - replicasets
    verbs: ["get", "list", "watch"]
---
# ClusterRole para acceso a etcd (requerido para backup/restore)
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: fintech-etcd-operator
  annotations:
    description: "Operaciones de backup y restore de etcd"
    component: "etcd"
    rbac.fintech.internal/aggregation: "etcd"
    audit.fintech.internal/loggable: "true"
    criticality: "critical"
rules:
  - apiGroups: [""]
    resources:
      - pods
    verbs: ["get", "list", "watch"]
  
  - apiGroups: [""]
    resources:
      - pods/exec
    verbs: ["create"]
  
  - apiGroups: [""]
    resources:
      - configmaps
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  
  - apiGroups: [""]
    resources:
      - events
    verbs: ["get", "list", "watch", "create"]
  
  - apiGroups: ["coordination.k8s.io"]
    resources:
      - leases
    verbs: ["get", "list", "watch", "create", "update", "patch"]


// === ARCHIVO: manifests/rbac/role-binding.yaml ===
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: fintech-admin-cluster-binding
  annotations:
    description: "Asignación de rol de administrador cluster-wide para el equipo de platform engineering"
    owner: "platform-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: fintech-admin-cluster-role
subjects:
  - kind: Group
    name: platform-engineers
    apiGroup: rbac.authorization.k8s.io
  - kind: Group
    name: sre-team
    apiGroup: rbac.authorization.k8s.io
  - kind: ServiceAccount
    name: argocd-application-controller
    namespace: argocd
  - kind: User
    name: juan.perez@fintech.internal
    apiGroup: rbac.authorization.k8s.io
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: fintech-devops-cluster-binding
  annotations:
    description: "Asignación de rol de DevOps para gestión de deployments"
    owner: "devops-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: fintech-devops-cluster-role
subjects:
  - kind: Group
    name: devops-engineers
    apiGroup: rbac.authorization.k8s.io
  - kind: ServiceAccount
    name: argocd-server
    namespace: argocd
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: fintech-viewer-cluster-binding
  annotations:
    description: "Asignación de rol de solo lectura cluster-wide para auditores"
    owner: "security-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: fintech-viewer-cluster-role
subjects:
  - kind: Group
    name: auditors
    apiGroup: rbac.authorization.k8s.io
  - kind: Group
    name: compliance-team
    apiGroup: rbac.authorization.k8s.io
  - kind: User
    name: auditor.externo@fintech.internal
    apiGroup: rbac.authorization.k8s.io
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: fintech-namespace-admin-binding
  namespace: fintech-app-prod
  annotations:
    description: "Asignación de rol de administrador a nivel de namespace para el equipo de producto"
    owner: "product-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: fintech-namespace-admin-role
subjects:
  - kind: Group
    name: fintech-product-team
    apiGroup: rbac.authorization.k8s.io
  - kind: ServiceAccount
    name: crossplane-provider
    namespace: crossplane-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: fintech-namespace-developer-binding
  namespace: fintech-app-dev
  annotations:
    description: "Asignación de rol de developer para entorno de desarrollo"
    owner: "dev-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: fintech-namespace-developer-role
subjects:
  - kind: Group
    name: developers
    apiGroup: rbac.authorization.k8s.io
  - kind: ServiceAccount
    name: argocd-application-controller
    namespace: argocd
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: fintech-crossplane-binding
  namespace: crossplane-system
  annotations:
    description: "Permisos para que Crossplane provisione recursos en el cluster"
    owner: "platform-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: crossplane-admin-role
subjects:
  - kind: ServiceAccount
    name: crossplane
    namespace: crossplane-system
  - kind: ServiceAccount
    name: crossplane-provider-aws
    namespace: crossplane-system
  - kind: ServiceAccount
    name: crossplane-provider-helm
    namespace: crossplane-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: fintech-vault-secrets-binding
  namespace: external-secrets
  annotations:
    description: "Permisos para que external-secrets lea secretos de Vault"
    owner: "security-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: vault-secrets-reader-role
subjects:
  - kind: ServiceAccount
    name: external-secrets
    namespace: external-secrets
  - kind: ServiceAccount
    name: vault-secrets-sync
    namespace: external-secrets
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: fintech-disaster-recovery-binding
  namespace: disaster-recovery
  annotations:
    description: "Permisos para el controller de disaster recovery"
    owner: "sre-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: disaster-recovery-controller-role
subjects:
  - kind: ServiceAccount
    name: failover-controller
    namespace: disaster-recovery
  - kind: ServiceAccount
    name: anti-split-brain-controller
    namespace: disaster-recovery
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: fintech-monitoring-cluster-binding
  annotations:
    description: "Permisos para Prometheus y Grafana a nivel de cluster"
    owner: "monitoring-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: prometheus-cluster-role
subjects:
  - kind: ServiceAccount
    name: prometheus
    namespace: monitoring
  - kind: ServiceAccount
    name: grafana
    namespace: monitoring
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: fintech-argocd-cluster-binding
  annotations:
    description: "Permisos para ArgoCD a nivel de cluster para gestión de aplicaciones"
    owner: "platform-team@fintech.internal"
    documentation: "https://fintech.internal/docs/rbac-federado"
    created-by: "rbac-automation"
    revision: "2024.01"
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: argocd-admin-cluster-role
subjects:
  - kind: ServiceAccount
    name: argocd-application-controller
    namespace: argocd
  - kind: ServiceAccount
    name: argocd-server
    namespace: argocd
  - kind: ServiceAccount
    name: argocd-repo-server
    namespace: argocd
// === ARCHIVO: manifests/disaster-recovery/failover-controller.yaml ===
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: clusterfailovers.fintech.internal
  annotations:
    description: "CRD para definir políticas de failover entre clusters Kubernetes"
    controller-gen.kubebuilder.io/version: v0.14.0
    cert-manager.io/inject-ca-from: "disaster-recovery/failover-controller-cert"
spec:
  group: fintech.internal
  names:
    kind: ClusterFailover
    listKind: ClusterFailoverList
    plural: clusterfailovers
    singular: clusterfailover
    shortNames:
      - cf
  scope: Namespaced
  versions:
    - name: v1alpha1
      served: true
      storage: true
      schema:
        openAPIV3Schema:
          type: object
          properties:
            spec:
              type: object
              required:
                - primaryCluster
                - standbyCluster
                - healthCheckEndpoint
                - failoverStrategy
              properties:
                primaryCluster:
                  type: string
                  description: "Nombre del cluster primario que está fallando"
                standbyCluster:
                  type: string
                  description: "Nombre del cluster standby que promoted"
                healthCheckEndpoint:
                  type: string
                  description: "Endpoint HTTP para health checks del cluster standby"
                failoverStrategy:
                  type: string
                  enum:
                    - automatic
                    - manual-approval
                    - staged
                  default: automatic
                timeoutSeconds:
                  type: integer
                  default: 180
                  description: "Timeout en segundos para el failover (3 minutos por defecto)"
                healthCheckIntervalSeconds:
                  type: integer
                  default: 10
                  description: "Intervalo de verificación de salud"
                healthCheckThreshold:
                  type: integer
                  default: 3
                  description: "Número de fallos consecutivos antes de iniciar failover"
                preFailoverScript:
                  type: string
                  description: "Script o comando a ejecutar antes del failover"
                postFailoverScript:
                  type: string
                  description: "Script o comando a ejecutar después del failover"
                rollbackEnabled:
                  type: boolean
                  default: true
                  description: "Habilitar rollback automático si el failover falla"
                notificationConfig:
                  type: object
                  properties:
                    slackWebhook:
                      type: string
                    emailRecipients:
                      type: array
                      items:
                        type: string
            status:
              type: object
              properties:
                phase:
                  type: string
                  enum:
                    - Idle
                    - HealthChecking
                    - PreFailoverExecuting
                    - FailoverInProgress
                    - PostFailoverExecuting
                    - Completed
                    - Failed
                    - RollingBack
                startTime:
                  type: string
                  format: date-time
                completionTime:
                  type: string
                  format: date-time
                lastHealthCheck:
                  type: string
                  format: date-time
                healthCheckFailures:
                  type: integer
                clusterStatus:
                  type: object
                  properties:
                    primary:
                      type: string
                    standby:
                      type: string
                errorMessage:
                  type: string
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: failover-controller-config
  namespace: disaster-recovery
  annotations:
    description: "Configuración del controller de failover"
data:
  config.yaml: |
    controller:
      leaderElection:
        enabled: true
        leaseDuration: 15s
        renewDeadline: 10s
        retryPeriod: 5s
      metrics:
        enabled: true
        port: 8080
      healthCheck:
        defaultTimeoutSeconds: 180
        defaultIntervalSeconds: 10
        defaultThreshold: 3
        timeoutMultiplier: 1.5
      failover:
        maxRetries: 3
        retryDelaySeconds: 30
        preFailoverGracePeriodSeconds: 30
        postFailoverGracePeriodSeconds: 60
      logging:
        level: info
        format: json
      notification:
        enabled: true
        retryAttempts: 3
        retryDelaySeconds: 10
---
apiVersion: v1
kind: Secret
metadata:
  name: failover-controller-tls
  namespace: disaster-recovery
type: kubernetes.io/tls
data:
  # Certificados TLS para comunicación segura entre controllers
  # Base64 encoded - reemplazar con valores reales en producción
  ca.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZGVtb3JkZXIgQ0VSVElGSUNBVEUtLS0tLQo=
  tls.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZGVtb3JkZXIgQ0VSVElGSUNBVEUtLS0tLQo=
  tls.key: LS0tLS1CRUdJTiBDUktQVEFEQVFBLS0tLS0tCk1JSUVBUU1Fd0RRWUo3SUNBZ0VDQXdnZ0lFaDBWR0F3SGhjTk1qTXdNVEF4TURBd01EQXdXaGNOTWpNd01UQXhNREF3TURBdwpXakFlTVJ3d0dnWURWUVFEREJOaGNIQXVaWGhoYlhCc1pTNWpiMjBnTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJCnpqMERBUWNEUWdBRXBsYWNlSG9sZGVyQ2VydGlmaWNhdGVEYXRhS2V5R2VuZXJhdGVkS2V5
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: failover-controller
  namespace: disaster-recovery
  labels:
    app: failover-controller
    component: disaster-recovery
    version: v1.0.0
  annotations:
    description: "Controller de failover que gestiona la promoción de clusters standby"
    owner: "sre-team@fintech.internal"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: failover-controller
  template:
    metadata:
      labels:
        app: failover-controller
        component: disaster-recovery
        version: v1.0.0
    spec:
      serviceAccountName: failover-controller
      priorityClassName: system-cluster-critical
      terminationGracePeriodSeconds: 60
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
            - weight: 100
              podAffinityTerm:
                labelSelector:
                  matchLabels:
                    app: failover-controller
                topologyKey: kubernetes.io/hostname
      containers:
        - name: controller
          image: fintech.azurecr.io/failover-controller:v1.0.0
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
              name: metrics
              protocol: TCP
            - containerPort: 8443
              name: webhook
              protocol: TCP
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: CONTROLLER_CONFIG_PATH
              value: /config/config.yaml
            - name: LOG_LEVEL
              value: "info"
            - name: HEALTH_CHECK_TIMEOUT
              value: "180"
            - name: ETCD_ENDPOINTS
              value: "https://etcd-0.fintech.internal:2379,https://etcd-1.fintech.internal:2379,https://etcd-2.fintech.internal:2379"
            - name: ETCD_CA_PATH
              value: /etc/etcd/tls/ca.crt
            - name: ETCD_CERT_PATH
              value: /etc/etcd/tls/server.crt
            - name: ETCD_KEY_PATH
              value: /etc/etcd/tls/server.key
            - name: VAULT_ADDR
              value: "https://vault.fintech.internal:8200"
            - name: VAULT_CACERT
              value: /etc/vault/tls/ca.crt
          resources:
            requests:
              cpu: 100m
              memory: 128Mi
            limits:
              cpu: 500m
              memory: 512Mi
          volumeMounts:
            - name: config
              mountPath: /config
              readOnly: true
            - name: etcd-tls
              mountPath: /etc/etcd/tls
              readOnly: true
            - name: vault-tls
              mountPath: /etc/vault/tls
              readOnly: true
          livenessProbe:
            httpGet:
              path: /healthz
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 10
            timeoutSeconds: 5
            failureThreshold: 3
          readinessProbe:
            httpGet:
              path: /readyz
              port: 8080
            initialDelaySeconds: 10
            periodSeconds: 5
            timeoutSeconds: 3
            failureThreshold: 3
          securityContext:
            runAsNonRoot: true
            runAsUser: 1000
            fsGroup: 1000
            capabilities:
              drop:
                - ALL
            allowPrivilegeEscalation: false
            seccompProfile:
              type: RuntimeDefault
      volumes:
        - name: config
          configMap:
            name: failover-controller-config
        - name: etcd-tls
          secret:
            secretName: etcd-client-tls
        - name: vault-tls
          secret:
            secretName: vault-client-tls
---
apiVersion: v1
kind: Service
metadata:
  name: failover-controller
  namespace: disaster-recovery
  labels:
    app: failover-controller
spec:
  ports:
    - name: metrics
      port: 8080
      targetPort: 8080
      protocol: TCP
    - name: webhook
      port: 8443
      targetPort: 8443
      protocol: TCP
  selector:
    app: failover-controller
  clusterIP: None
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: failover-controller
  namespace: disaster-recovery
  annotations:
    description: "ServiceAccount para el controller de failover"
    owner: "sre-team@fintech.internal"
---
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: failover-controller-pdb
  namespace: disaster-recovery
spec:
  minAvailable: 1
  selector:
    matchLabels:
      app: failover-controller
// === ARCHIVO: manifests/disaster-recovery/anti-split-brain.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: anti-split-brain-config
  namespace: disaster-recovery
  annotations:
    description: "Configuración del mecanismo de quorum para evitar split-brain"
    documentation: "https://fintech.internal/docs/anti-split-brain"
data:
  quorum-config.yaml: |
    quorum:
      algorithm: raft
      clusterSize: 3
      quorumSize: 2
      heartbeatInterval: 1s
      electionTimeout: 5s
      maxLogEntries: 1000
      
    etcd:
      endpoints:
        - https://etcd-0.fintech.internal:2379
        - https://etcd-1.fintech.internal:2379
        - https://etcd-2.fintech.internal:2379
      autoCompactionMode: periodic
      autoCompactionRetention: 1h
      quotaBackendBytes: 8589934592
      
    fencing:
      enabled: true
      fencingTimeout: 10s
      releaseTimeout: 30s
      maxFenceRetries: 3
      
    splitBrainDetection:
      enabled: true
      checkInterval: 5s
      alertThreshold: 2
      autoHealEnabled: true
    
    logging:
      level: info
      format: json
      output: stdout
---
apiVersion: v1
kind: Secret
metadata:
  name: etcd-anti-split-brain-tls
  namespace: disaster-recovery
type: Opaque
data:
  # Certificados TLS para comunicación segura del cluster etcd
  # Base64 encoded - reemplazar con valores reales en producción
  etcd-ca.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZGVtb3JkZXIgQ0VSVElGSUNBVEUtLS0tLQo=
  etcd-peer.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZGVtb3JkZXIgQ0VSVElGSUNBVEUtLS0tLQo=
  etcd-peer.key: LS0tLS1CRUdJTiBDUktQVEFEQVFBLS0tLS0tCk1JSUVBUU1Fd0RRWUo3SUNBZ0VDQXdnZ0lFaDBWR0F3SGhjTk1qTXdNVEF4TURBd01EQXdXaGNOTWpNd01UQXhNREF3TURBdwpXakFlTVJ3d0dnWURWUVFEREJOaGNIQXVaWGhoYlhCc1pTNWpiMjBnTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJCnpqMERBUWNEUWdBRXBsYWNlSG9sZGVyQ2VydGlmaWNhdGVEYXRhS2V5R2VuZXJhdGVkS2V5
  etcd-server.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZGVtb3JkZXIgQ0VSVElGSUNBVEUtLS0tLQo=
  etcd-server.key: LS0tLS1CRUdJTiBDUktQVEFEQVFBLS0tLS0tCk1JSUVBUU1Fd0RRWUo3SUNBZ0VDQXdnZ0lFaDBWR0F3SGhjTk1qTXdNVEF4TURBd01EQXdXaGNOTWpNd01UQXhNREF3TURBdwpXakFlTVJ3d0dnWURWUVFEREJOaGNIQXVaWGhoYlhCc1pTNWpiMjBnTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJCnpqMERBUWNEUWdBRXBsYWNlSG9sZGVyQ2VydGlmaWNhdGVEYXRhS2V5R2VuZXJhdGVkS2V5
  etcd-client.crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJZGVtb3JkZXIgQ0VSVElGSUNBVEUtLS0tLQo=
  etcd-client.key: LS0tLS1CRUdJTiBDUktQVEFEQVFBLS0tLS0tCk1JSUVBUU1Fd0RRWUo3SUNBZ0VDQXdnZ0lFaDBWR0F3SGhjTk1qTXdNVEF4TURBd01EQXdXaGNOTWpNd01UQXhNREF3TURBdwpXakFlTVJ3d0dnWURWUVFEREJOaGNIQXVaWGhoYlhCc1pTNWpiMjBnTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJCnpqMERBUWNEUWdBRXBsYWNlSG9sZGVyQ2VydGlmaWNhdGVEYXRhS2V5R2VuZXJhdGVkS2V5
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: anti-split-brain-etcd
  namespace: disaster-recovery
  labels:
    app: anti-split-brain-etcd
    component: quorum
    etcd: "true"
  annotations:
    description: "Cluster etcd para implementar mecanismo de quorum y evitar split-brain"
    owner: "sre-team@fintech.internal"
spec:
  serviceName: etcd-headless
  replicas: 3
  podManagementPolicy: Parallel
  updateStrategy:
    type: RollingUpdate
  selector:
    matchLabels:
      app: anti-split-brain-etcd
  template:
    metadata:
      labels:
        app: anti-split-brain-etcd
        etcd: "true"
    spec:
      serviceAccountName: etcd
      securityContext:
        fsGroup: 1000
        runAsNonRoot: true
        runAsUser: 1000
      containers:
        - name: etcd
          image: gcr.io/etcd-development/etcd:v3.5.12
          imagePullPolicy: IfNotPresent
          command:
            - /etc/etcd/etcd.conf.yaml
          env:
            - name: ETCD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: ETCD_INITIAL_CLUSTER_STATE
              value: "new"
            - name: ETCD_INITIAL_CLUSTER_TOKEN
              value: "fintech-dr-quorum"
            - name: ETCD_AUTO_COMPACTION_MODE
              value: "periodic"
            - name: ETCD_AUTO_COMPACTION_RETENTION
              value: "1h"
            - name: ETCD_QUOTA_BACKEND_BYTES
              value: "8589934592"
          ports:
            - containerPort: 2379
              name: client
            - containerPort: 2380
              name: peer
          resources:
            requests:
              cpu: 100m
              memory: 256Mi
            limits:
              cpu: 500m
              memory: 1Gi
          volumeMounts:
            - name: etcd-data
              mountPath: /var/lib/etcd
            - name: etcd-config
              mountPath: /etc/etcd
          livenessProbe:
            exec:
              command:
                - /bin/sh
                - -ec
                - ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/etcd/tls/ca.crt --cert=/etc/etcd/tls/server.crt --key=/etc/etcd/tls/server.key endpoint health
            initialDelaySeconds: 30
            periodSeconds: 10
            timeoutSeconds: 5
            failureThreshold: 3
          readinessProbe:
            exec:
              command:
                - /bin/sh
                - -ec
                - ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/etcd/tls/ca.crt --cert=/etc/etcd/tls/server.crt --key=/etc/etcd/tls/server.key endpoint health
            initialDelaySeconds: 10
            periodSeconds: 5
            timeoutSeconds: 3
            failureThreshold: 3
          securityContext:
            capabilities:
              drop:
                - ALL
            allowPrivilegeEscalation: false
            seccompProfile:
              type: RuntimeDefault
      volumes:
        - name: etcd-data
          emptyDir:
            sizeLimit: 10Gi
        - name: etcd-config
          configMap:
            name: etcd-configmap
---
apiVersion: v1
kind: Service
metadata:
  name: etcd-headless
  namespace: disaster-recovery
  labels:
    app: anti-split-brain-etcd
spec:
  ports:
    - name: client
      port: 2379
      targetPort: 2379
    - name: peer
      port: 2380
      targetPort: 2380
  clusterIP: None
  selector:
    app: anti-split-brain-etcd
---
apiVersion: v1
kind: Service
metadata:
  name: etcd-client
  namespace: disaster-recovery
  labels:
    app: anti-split-brain-etcd
spec:
  ports:
    - name: client
      port: 2379
      targetPort: 2379
  selector:
    app: anti-split-brain-etcd
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: etcd
  namespace: disaster-recovery
  annotations:
    description: "ServiceAccount para el cluster etcd del quorum"
    owner: "sre-team@fintech.internal"
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: anti-split-brain-controller
  namespace: disaster-recovery
  labels:
    app: anti-split-brain-controller
    component: quorum-manager
  annotations:
    description: "Controller que monitorea el quorum y ejecuta acciones de fencing"
    owner: "sre-team@fintech.internal"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: anti-split-brain-controller
  template:
    metadata:
      labels:
        app: anti-split-brain-controller
        component: quorum-manager
    spec:
      serviceAccountName: anti-split-brain-controller
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
            - weight: 100
              podAffinityTerm:
                labelSelector:
                  matchLabels:
                    app: anti-split-brain-controller
                topologyKey: kubernetes.io/hostname
      containers:
        - name: controller
          image: fintech.azurecr.io/anti-split-brain-controller:v1.0.0
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
              name: metrics
            - containerPort: 9090
              name: webhook
          env:
            - name: ETCD_ENDPOINTS
              value: "https://etcd-0.fintech.internal:2379,https://etcd-1.fintech.internal:2379,https://etcd-2.fintech.internal:2379"
            - name: ETCD_CA_PATH
              value: /etc/etcd/tls/ca.crt
            - name: ETCD_CERT_PATH
              value: /etc/etcd/tls/client.crt
            - name: ETCD_KEY_PATH
              value: /etc/etcd/tls/client.key
            - name: QUORUM_CHECK_INTERVAL
              value: "5s"
            - name: FENCING_ENABLED
              value: "true"
            - name: FENCING_TIMEOUT
              value: "10s"
            - name: LOG_LEVEL
              value: "info"
          resources:
            requests:
              cpu: 50m
              memory: 64Mi
            limits:
              cpu: 200m
              memory: 256Mi
          volumeMounts:
            - name: etcd-tls
              mountPath: /etc/etcd/tls
              readOnly: true
            - name: config
              mountPath: /config
              readOnly: true
          livenessProbe:
            httpGet:
              path: /healthz
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 10
          readinessProbe:
            httpGet:
              path: /readyz
              port: 8080
            initialDelaySeconds: 10
            periodSeconds: 5
      volumes:
        - name: etcd-tls
          secret:
            secretName: etcd-anti-split-brain-tls
        - name: config
          configMap:
            name: anti-split-brain-config
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: anti-split-brain-controller
  namespace: disaster-recovery
  annotations:
    description: "ServiceAccount para el controller anti-split-brain"
    owner: "sre-team@fintech.internal"
---
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: anti-split-brain-pdb
  namespace: disaster-recovery
spec:
  minAvailable: 1
  selector:
    matchLabels:
      app: anti-split-brain-controller
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: etcd-configmap
  namespace: disaster-recovery
data:
  etcd.conf.yaml: |
    name: ${ETCD_NAME}
    data-dir: /var/lib/etcd
    listen-peer-urls: https://0.0.0.0:2380
    listen-client-urls: https://0.0.0.0:2379
    initial-cluster: etcd-0=https://etcd-0.fintech.internal:2380,etcd-1=https://etcd-1.fintech.internal:2380,etcd-2=https://etcd-2.fintech.internal:2380
    initial-cluster-state: new
    initial-cluster-token: fintech-dr-quorum
    client-transport-security:
      cert-file: /etc/etcd/tls/server.crt
      key-file: /etc/etcd/tls/server.key
      client-cert-auth: true
      trusted-ca-file: /etc/etcd/tls/ca.crt
    peer-transport-security:
      cert-file: /etc/etcd/tls/peer.crt
      key-file: /etc/etcd/tls/peer.key
      peer-client-cert-auth: true
      trusted-ca-file: /etc/etcd/tls/ca.crt
    election-timeout: 5000
    heartbeat-interval: 1000


// === ARCHIVO: manifests/apps/nginx-deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fintech-nginx
  namespace: fintech-production
  labels:
    app: fintech-nginx
    tier: frontend
    environment: production
    region: us-east-1
    managed-by: argocd
    fintech.internal/component: web-frontend
    fintech.internal/team: platform-engineering
  annotations:
    description: "Deployment de Nginx como reverse proxy y balanceador para la aplicación fintech"
    owner: "Platform Engineering Team (platform@fintech.internal)"
    maintenance-window: "04:00-06:00 UTC todos los domingos"
    rollback-policy: "auto-rollback en caso de fallo de health check"
    replication-strategy: "active-active en us-east-1 y us-west-2"
    disaster-recovery-tier: "tier-1-critical"
spec:
  replicas: 3
  revisionHistoryLimit: 5
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  selector:
    matchLabels:
      app: fintech-nginx
  template:
    metadata:
      labels:
        app: fintech-nginx
        tier: frontend
        environment: production
        region: us-east-1
        version: v1.4.0
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "9113"
        prometheus.io/path: "/metrics"
        argocd.argoproj.io/compare-options: IgnoreExtraneous
        argocd.argoproj.io/sync-options: Prune=false
    spec:
      serviceAccountName: fintech-nginx-sa
      securityContext:
        runAsNonRoot: false
        fsGroup: 101
        runAsUser: 101
      terminationGracePeriodSeconds: 30
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 100
            podAffinityTerm:
              labelSelector:
                matchLabels:
                  app: fintech-nginx
              topologyKey: topology.kubernetes.io/zone
        nodeAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 50
            preference:
              matchExpressions:
              - key: node-type
                operator: In
                values:
                - compute-optimized
      topologySpreadConstraints:
      - maxSkew: 1
        topologyKey: topology.kubernetes.io/zone
        whenUnsatisfiable: DoNotSchedule
        labelSelector:
          matchLabels:
            app: fintech-nginx
      - maxSkew: 1
        topologyKey: kubernetes.io/hostname
        whenUnsatisfiable: ScheduleAnyway
        labelSelector:
          matchLabels:
            app: fintech-nginx
      tolerations:
      - key: "dedicated"
        operator: "Equal"
        value: "frontend"
        effect: "NoSchedule"
      - key: "critical"
        operator: "Exists"
        effect: "NoExecute"
        tolerationSeconds: 300
      containers:
      - name: nginx
        image: nginx:1.25-alpine
        imagePullPolicy: IfNotPresent
        ports:
        - name: http
          containerPort: 80
          protocol: TCP
        - name: https
          containerPort: 443
          protocol: TCP
        - name: metrics
          containerPort: 9113
          protocol: TCP
        env:
        - name: NGINX_HOST
          value: "fintech.internal"
        - name: NGINX_PORT
          value: "80"
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        - name: NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        - name: REGION
          value: "us-east-1"
        - name: CLUSTER_NAME
          value: "primary-us-east-1"
        - name: VAULT_ADDR
          valueFrom:
            configMapKeyRef:
              name: fintech-config
              key: vault.address
              optional: true
        - name: LOG_LEVEL
          value: "info"
        - name: ENABLE_METRICS
          value: "true"
        - name: ENABLE_TRACING
          value: "true"
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
            ephemeral-storage: 100Mi
          limits:
            cpu: 500m
            memory: 512Mi
            ephemeral-storage: 500Mi
        livenessProbe:
          httpGet:
            path: /healthz
            port: 80
            scheme: HTTP
          initialDelaySeconds: 10
          periodSeconds: 15
          timeoutSeconds: 5
          successThreshold: 1
          failureThreshold: 3
        readinessProbe:
          httpGet:
            path: /ready
            port: 80
            scheme: HTTP
          initialDelaySeconds: 5
          periodSeconds: 10
          timeoutSeconds: 3
          successThreshold: 1
          failureThreshold: 3
        startupProbe:
          httpGet:
            path: /healthz
            port: 80
            scheme: HTTP
          initialDelaySeconds: 0
          periodSeconds: 5
          timeoutSeconds: 3
          failureThreshold: 30
        volumeMounts:
        - name: nginx-config
          mountPath: /etc/nginx/conf.d
          readOnly: true
        - name: nginx-cache
          mountPath: /var/cache/nginx
          readOnly: false
        - name: nginx-run
          mountPath: /var/run
          readOnly: false
        - name: tls-certs
          mountPath: /etc/nginx/ssl
          readOnly: true
        - name: fintech-templates
          mountPath: /usr/share/nginx/html
          readOnly: true
        - name: timezone
          mountPath: /etc/localtime
          readOnly: true
        - name: timezone-data
          mountPath: /usr/share/zoneinfo
          readOnly: true
        securityContext:
          allowPrivilegeEscalation: false
          readOnlyRootFilesystem: true
          capabilities:
            drop:
            - ALL
            add:
            - NET_BIND_SERVICE
      volumes:
      - name: nginx-config
        configMap:
          name: fintech-nginx-config
          defaultMode: 0444
          optional: false
      - name: nginx-cache
        emptyDir:
          medium: Memory
          sizeLimit: 256Mi
      - name: nginx-run
        emptyDir:
          medium: Memory
          sizeLimit: 10Mi
      - name: tls-certs
        secret:
          secretName: fintech-tls-secret
          defaultMode: 0444
          optional: true
      - name: fintech-templates
        configMap:
          name: fintech-templates
          defaultMode: 0444
          optional: true
      - name: timezone
        hostPath:
          path: /etc/localtime
          type: File
      - name: timezone-data
        hostPath:
          path: /usr/share/zoneinfo
          type: Directory
      hostNetwork: false
      dnsPolicy: ClusterFirst
      dnsConfig:
        nameservers:
        - 10.96.0.10
        searches:
        - fintech-production.svc.cluster.local
        - svc.cluster.local
        options:
        - name: ndots
          value: "2"
---
apiVersion: v1
kind: Service
metadata:
  name: fintech-nginx
  namespace: fintech-production
  labels:
    app: fintech-nginx
    tier: frontend
    environment: production
    managed-by: argocd
    fintech.internal/service-type: load-balancer
    fintech.internal/team: platform-engineering
  annotations:
    description: "Servicio ClusterIP para el deployment de Nginx"
    owner: "Platform Engineering Team (platform@fintech.internal)"
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
    service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: "true"
    service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "http"
    service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "arn:aws:acm:us-east-1:123456789012:certificate/abc123"
    service.beta.kubernetes.io/aws-load-balancer-ssl-negotiation-policy: "ELBSecurityPolicy-2016-08"
    service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: "4000"
    service.beta.kubernetes.io/aws-load-balancer-proxy-protocol: "*"
    prometheus.io/scrape: "true"
    prometheus.io/port: "9113"
spec:
  type: ClusterIP
  ports:
  - name: http
    port: 80
    targetPort: http
    protocol: TCP
    appProtocol: http
  - name: https
    port: 443
    targetPort: https
    protocol: TCP
    appProtocol: https
  - name: metrics
    port: 9113
    targetPort: metrics
    protocol: TCP
    appProtocol: http
  selector:
    app: fintech-nginx
  sessionAffinity: ClientIP
  sessionAffinityConfig:
    clientIP:
      timeoutSeconds: 10800
  publishNotReadyAddresses: false
  externalTrafficPolicy: Cluster
  internalTrafficPolicy: Cluster
---
apiVersion: v1
kind: Service
metadata:
  name: fintech-nginx-nodeport
  namespace: fintech-production
  labels:
    app: fintech-nginx
    tier: frontend
    environment: production
    managed-by: argocd
    fintech.internal/service-type: node-port
  annotations:
    description: "Servicio NodePort para acceso interno durante mantenimiento"
    owner: "Platform Engineering Team"
spec:
  type: NodePort
  ports:
  - name: http
    nodePort: 30080
    port: 80
    targetPort: http
    protocol: TCP
  - name: https
    nodePort: 30443
    port: 443
    targetPort: https
    protocol: TCP
  selector:
    app: fintech-nginx
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: fintech-nginx-hpa
  namespace: fintech-production
  labels:
    app: fintech-nginx
    managed-by: argocd
  annotations:
    description: "HPA para escalamiento automático basado en CPU y memoria"
    owner: "Platform Engineering Team"
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: fintech-nginx
  minReplicas: 3
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
  - type: Pods
    pods:
      metric:
        name: http_requests_per_second
      target:
        type: AverageValue
        averageValue: 1000m
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 60
      policies:
      - type: Percent
        value: 100
        periodSeconds: 60
      - type: Pods
        value: 4
        periodSeconds: 60
      selectPolicy: Max
    scaleDown:
      stabilizationWindowSeconds: 300
      policies:
      - type: Percent
        value: 10
        periodSeconds: 60
      - type: Pods
        value: 2
        periodSeconds: 60
      selectPolicy: Min
---
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: fintech-nginx-pdb
  namespace: fintech-production
  labels:
    app: fintech-nginx
    managed-by: argocd
  annotations:
    description: "PDB para garantizar disponibilidad durante actualizaciones"
    owner: "Platform Engineering Team"
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: fintech-nginx
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: fintech-nginx-config
  namespace: fintech-production
  labels:
    app: fintech-nginx
    managed-by: argocd
  annotations:
    description: "Configuración principal de Nginx"
    owner: "Platform Engineering Team"
data:
  default.conf: |-
    server_tokens off;
    client_max_body_size 10M;
    client_body_buffer_size 128k;
    proxy_connect_timeout 60s;
    proxy_send_timeout 60s;
    proxy_read_timeout 60s;
    send_timeout 60s;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for" '
                    'rt=$request_time uct="$upstream_connect_time" '
                    'uht="$upstream_header_time" urt="$upstream_response_time"';

    access_log /var/log/nginx/access.log main;
    error_log /var/log/nginx/error.log warn;

    upstream backend {
        least_conn;
        server backend-1.fintech.internal:8080 max_fails=3 fail_timeout=30s;
        server backend-2.fintech.internal:8080 max_fails=3 fail_timeout=30s;
        server backend-3.fintech.internal:8080 max_fails=3 fail_timeout=30s;
        keepalive 32;
    }

    server {
        listen 80;
        listen [::]:80;
        server_name fintech.internal api.fintech.internal;

        location /healthz {
            access_log off;
            return 200 "healthy\n";
            add_header Content-Type text/plain;
        }

        location /ready {
            access_log off;
            proxy_pass http://backend/ready;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        location / {
            proxy_pass http://backend;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Connection "";

            proxy_buffering on;
            proxy_buffer_size 4k;
            proxy_buffers 8 4k;
            proxy_busy_buffers_size 8k;

            proxy_connect_timeout 60s;
            proxy_send_timeout 60s;
            proxy_read_timeout 60s;
        }

        location /metrics {
            proxy_pass http://127.0.0.1:9113/metrics;
            proxy_set_header Host $host;
        }
    }
  ssl.conf: |-
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384';
    ssl_prefer_server_ciphers off;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 1d;
    ssl_session_tickets off;

    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4 valid=300s;
    resolver_timeout 5s;
---
apiVersion: v1
kind: Secret
metadata:
  name: fintech-tls-secret
  namespace: fintech-production
  labels:
    app: fintech-nginx
    managed-by: argocd
  annotations:
    description: "Secretos TLS para HTTPS (gestionado por Vault + external-secrets)"
    owner: "Security Team"
type: kubernetes.io/tls
stringData:
  # Los certificados se inyectan automaticamente desde Vault
  # mediante external-secrets-operator
  # Este es un placeholder para validacion de esquema
  tls.crt: "placeholder"
  tls.key: "placeholder"
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: fintech-nginx-role
  namespace: fintech-production
  labels:
    app: fintech-nginx
  annotations:
    description: "Rol a nivel de namespace para el deployment de Nginx"
    owner: "Platform Engineering Team"
rules:
- apiGroups: [""]
  resources: ["configmaps", "secrets", "services"]
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch", "update", "patch"]
- apiGroups: ["apps"]
  resources: ["deployments", "replicasets"]
  verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: fintech-nginx-rolebinding
  namespace: fintech-production
  labels:
    app: fintech-nginx
  annotations:
    description: "RoleBinding para asociar el service account con su rol"
    owner: "Platform Engineering Team"
subjects:
- kind: ServiceAccount
  name: fintech-nginx-sa
  namespace: fintech-production
roleRef:
  kind: Role
  name: fintech-nginx-role
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: fintech-nginx-sa
  namespace: fintech-production
  labels:
    app: fintech-nginx
  annotations:
    description: "Service account dedicado para el deployment de Nginx"
    owner: "Platform Engineering Team"
    iam.amazonaws.com/role: "arn:aws:iam::123456789012:role/fintech-nginx-role"
imagePullSecrets:
- name: fintech-registry-secret


// === ARCHIVO: tests/argocd-sync-test.yaml ===
apiVersion: v1
kind: List
items:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: argocd-sync-test-assertions
      namespace: argocd
      labels:
        app: argocd-sync-validation
        test-runner: fintech-control-plane
      annotations:
        description: "Validaciones de sincronizacion ArgoCD para multi-cluster fintech"
        maintainer: "platform-team@fintech.internal"
    data:
      test-script.sh: |
        #!/bin/bash
        set -euo pipefail
        
        # Test: Verificar que ArgoCD puede sincronizar aplicaciones en todos los clusters
        readonly ARGOCD_SERVER="argocd.fintech.internal"
        readonly APP_NAME="fintech-app"
        readonly EXPECTED_CLUSTERS="dev staging prod"
        readonly SYNC_TIMEOUT=300
        readonly HEALTH_TIMEOUT=180
        
        echo "=== ArgoCD Sync Test Suite ==="
        echo "Start time: $(date -Iseconds)"
        
        # Test 1: Verificar que la aplicacion existe en ArgoCD
        echo "[TEST 1] Verificando existencia de aplicacion en ArgoCD..."
        if ! argocd app get $APP_NAME --server $ARGOCD_SERVER > /dev/null 2>&1; then
          echo "FAIL: Aplicacion $APP_NAME no encontrada en ArgoCD"
          exit 1
        fi
        echo "PASS: Aplicacion $APP_NAME encontrada"
        
        # Test 2: Verificar estado de sincronizacion en cluster de desarrollo
        echo "[TEST 2] Verificando sync en cluster dev..."
        if ! argocd app sync $APP_NAME --server argocd.dev.fintech.internal --timeout $SYNC_TIMEOUT; then
          echo "FAIL: Sincronizacion en dev fallo"
          exit 1
        fi
        echo "PASS: Sincronizacion en dev completada"
        
        # Test 3: Verificar estado de sincronizacion en cluster staging
        echo "[TEST 3] Verificando sync en cluster staging..."
        if ! argocd app sync $APP_NAME --server argocd.staging.fintech.internal --timeout $SYNC_TIMEOUT; then
          echo "FAIL: Sincronizacion en staging fallo"
          exit 1
        fi
        echo "PASS: Sincronizacion en staging completada"
        
        # Test 4: Verificar estado de sincronizacion en cluster production
        echo "[TEST 4] Verificando sync en cluster prod..."
        if ! argocd app sync $APP_NAME --server argocd.prod.fintech.internal --timeout $SYNC_TIMEOUT; then
          echo "FAIL: Sincronizacion en prod fallo"
          exit 1
        fi
        echo "PASS: Sincronizacion en prod completada"
        
        # Test 5: Verificar que todos los recursos fueron creados correctamente
        echo "[TEST 5] Verificando recursos desplegados en cada cluster..."
        for cluster in dev staging prod; do
          echo "  Verificando cluster: $cluster"
          RESOURCE_COUNT=$(argocd app resources $APP_NAME --server argocd.$cluster.fintech.internal -o json | jq -r '.[] | select(.health.status=="Healthy") | .name' | wc -l)
          if [ "$RESOURCE_COUNT" -lt 5 ]; then
            echo "FAIL: Recursos insuficientes en $cluster (encontrados: $RESOURCE_COUNT, esperados: >=5)"
            exit 1
          fi
          echo "  PASS: $cluster tiene $RESOURCE_COUNT recursos healthy"
        done
        
        # Test 6: Verificar rollback automatico en caso de fallo
        echo "[TEST 6] Verificando politica de sync..."
        SYNC_POLICY=$(argocd app get $APP_NAME --server $ARGOCD_SERVER -o json | jq -r '.spec.syncPolicy.automated // null')
        if [ "$SYNC_POLICY" == "null" ]; then
          echo "WARN: Sync automatico no esta habilitado"
        else
          echo "PASS: Sync automatico habilitado"
        fi
        
        # Test 7: Verificar historial de revisiones
        echo "[TEST 7] Verificando historial de sync..."
        REVISION_COUNT=$(argocd app history $APP_NAME --server $ARGOCD_SERVER -o json | jq -r '.[] | length')
        if [ "$REVISION_COUNT" -lt 1 ]; then
          echo "FAIL: Sin historial de sincronizaciones"
          exit 1
        fi
        echo "PASS: Historial tiene $REVISION_COUNT revisiones"
        
        # Test 8: Verificar drift detection
        echo "[TEST 8] Verificando deteccion de drift..."
        for cluster in dev staging prod; do
          if argocd app diff $APP_NAME --server argocd.$cluster.fintech.internal > /dev/null 2>&1; then
            echo "  WARN: Drift detectado en $cluster"
          else
            echo "  PASS: Sin drift en $cluster"
          fi
        done
        
        echo "=== Todas las pruebas pasaron ==="
        echo "End time: $(date -Iseconds)"
        exit 0

  - apiVersion: batch/v1
    kind: Job
    metadata:
      name: argocd-sync-test-runner
      namespace: argocd
      labels:
        app: argocd-sync-validation
        test-type: integration
        test-runner: fintech-control-plane
      annotations:
        description: "Job que ejecuta tests de sincronizacion ArgoCD"
        maintainer: "platform-team@fintech.internal"
    spec:
      ttlSecondsAfterFinished: 3600
      backoffLimit: 2
      template:
        metadata:
          labels:
            app: argocd-sync-validation
        spec:
          serviceAccountName: argocd-application-controller
          restartPolicy: OnFailure
          containers:
            - name: test-runner
              image: argoproj/argo-cd:v2.10.0
              imagePullPolicy: IfNotPresent
              command:
                - /bin/bash
                - /scripts/test-script.sh
              env:
                - name: ARGOCD_AUTH_TOKEN
                  valueFrom:
                    secretKeyRef:
                      name: argocd-credentials
                      key: auth-token
                      optional: true
              volumeMounts:
                - name: test-script
                  mountPath: /scripts
                  readOnly: true
              resources:
                requests:
                  memory: "256Mi"
                  cpu: "100m"
                limits:
                  memory: "512Mi"
                  cpu: "500m"
          volumes:
            - name: test-script
              configMap:
                name: argocd-sync-test-assertions
                defaultMode: 0755

  - apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: argocd-sync-test-runner
      namespace: argocd
      labels:
        app: argocd-sync-validation
      annotations:
        description: "Service account para ejecutar tests de sync ArgoCD"

  - apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      name: argocd-sync-test-runner
      namespace: argocd
      labels:
        app: argocd-sync-validation
    rules:
      - apiGroups: ["argoproj.io"]
        resources: ["applications"]
        verbs: ["get", "list", "watch", "sync"]
      - apiGroups: ["argoproj.io"]
        resources: ["appprojects"]
        verbs: ["get", "list"]

  - apiVersion: rbac.authorization.k8s.io/v1
    kind: RoleBinding
    metadata:
      name: argocd-sync-test-runner
      namespace: argocd
      labels:
        app: argocd-sync-validation
    subjects:
      - kind: ServiceAccount
        name: argocd-sync-test-runner
        namespace: argocd
    roleRef:
      kind: Role
      name: argocd-sync-test-runner
      apiGroup: rbac.authorization.k8s.io

---

// === ARCHIVO: tests/crossplane-provisioning-test.yaml ===
apiVersion: v1
kind: List
items:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: crossplane-provisioning-test-assertions
      namespace: crossplane-system
      labels:
        app: crossplane-provisioning-validation
        test-runner: fintech-control-plane
      annotations:
        description: "Validaciones de provisionamiento Crossplane para infraestructura fintech"
        maintainer: "platform-team@fintech.internal"
    data:
      test-script.sh: |
        #!/bin/bash
        set -euo pipefail
        
        # Test: Verificar provisionamiento de infraestructura con Crossplane
        readonly CROSSPLANE_NAMESPACE="crossplane-system"
        readonly PROVIDER_AWS="provider-aws"
        readonly PROVIDER_HELM="provider-helm"
        readonly COMPOSITION_NAME="fintech-aws-network"
        readonly XRD_NAME="xnetworkfintech"
        readonly CLAIM_TIMEOUT=300
        
        echo "=== Crossplane Provisioning Test Suite ==="
        echo "Start time: $(date -Iseconds)"
        
        # Test 1: Verificar que los providers de Crossplane esten instalados y healthy
        echo "[TEST 1] Verificando providers de Crossplane..."
        kubectl get providers -n $CROSSPLANE_NAMESPACE
        
        PROVIDER_AWS_STATUS=$(kubectl get provider $PROVIDER_AWS -n $CROSSPLANE_NAMESPACE -o jsonpath='{.status.conditions[?(@.type=="Healthy")].status}' 2>/dev/null || echo "NotFound")
        if [ "$PROVIDER_AWS_STATUS" != "True" ]; then
          echo "FAIL: Provider AWS no esta healthy"
          exit 1
        fi
        echo "PASS: Provider AWS esta healthy"
        
        PROVIDER_HELM_STATUS=$(kubectl get provider $PROVIDER_HELM -n $CROSSPLANE_NAMESPACE -o jsonpath='{.status.conditions[?(@.type=="Healthy")].status}' 2>/dev/null || echo "NotFound")
        if [ "$PROVIDER_HELM_STATUS" != "True" ]; then
          echo "FAIL: Provider Helm no esta healthy"
          exit 1
        fi
        echo "PASS: Provider Helm esta healthy"
        
        # Test 2: Verificar que las composiciones esten registradas
        echo "[TEST 2] Verificando Compositions registradas..."
        kubectl get compositions
        
        if ! kubectl get composition $COMPOSITION_NAME -n $CROSSPLANE_NAMESPACE > /dev/null 2>&1; then
          echo "FAIL: Composition $COMPOSITION_NAME no encontrada"
          exit 1
        fi
        echo "PASS: Composition $COMPOSITION_NAME encontrada"
        
        # Test 3: Verificar que los CompositeResourceDefinitions (XRD) esten registrados
        echo "[TEST 3] Verificando CompositeResourceDefinitions..."
        kubectl get compositeresourcedefinitions
        
        if ! kubectl get compositeresourcedefinition $XRD_NAME -n $CROSSPLANE_NAMESPACE > /dev/null 2>&1; then
          echo "FAIL: XRD $XRD_NAME no encontrada"
          exit 1
        fi
        echo "PASS: XRD $XRD_NAME encontrada"
        
        # Test 4: Crear un recurso compuesto y verificar provisionamiento
        echo "[TEST 4] Verificando provisionamiento de recurso compuesto..."
        cat <<EOF | kubectl apply -f -
apiVersion: network.fintech.internal/v1alpha1
kind: Network
metadata:
  name: test-network-provisioning
  namespace: default
spec:
  region: us-east-1
  vpcCidr: "10.0.0.0/16"
  availabilityZones:
    - us-east-1a
    - us-east-1b
    - us-east-1c
  tags:
    environment: test
    managed-by: crossplane
    project: fintech-control-plane
  compositionSelector:
    matchLabels:
      provider: aws
      type: network
EOF
        
        # Esperar a que el recurso se aprovisione
        echo "Esperando provisionamiento (timeout: ${CLAIM_TIMEOUT}s)..."
        if ! kubectl wait --for=condition=Ready network/test-network-provisioning --timeout=${CLAIM_TIMEOUT}s 2>/dev/null; then
          echo "FAIL: Timeout esperando provisionamiento del recurso"
          kubectl get network test-network-provisioning -o yaml
          exit 1
        fi
        echo "PASS: Recurso aprovisionado exitosamente"
        
        # Test 5: Verificar que los recursos de AWS fueron creados
        echo "[TEST 5] Verificando recursos de AWS creados..."
        VPC_ID=$(kubectl get network test-network-provisioning -o jsonpath='{.status.vpcId}')
        if [ -z "$VPC_ID" ]; then
          echo "FAIL: VPC ID no generado"
          exit 1
        fi
        echo "PASS: VPC $VPC_ID creada"
        
        SUBNET_COUNT=$(kubectl get network test-network-provisioning -o jsonpath='{.status.subnetIds}' | jq 'length')
        if [ "$SUBNET_COUNT" -lt 3 ]; then
          echo "FAIL: Subnets insuficientes (esperadas: 3, encontradas: $SUBNET_COUNT)"
          exit 1
        fi
        echo "PASS: $SUBNET_COUNT subnets creadas"
        
        # Test 6: Verificar estado de los managed resources
        echo "[TEST 6] Verificando Managed Resources..."
        kubectl get managed
        
        # Test 7: Verificar resolucion de referencias entre recursos
        echo "[TEST 7] Verificando referencias entre recursos..."
        SECURITY_GROUP_ID=$(kubectl get network test-network-provisioning -o jsonpath='{.status.securityGroupIds[0]}')
        if [ -z "$SECURITY_GROUP_ID" ]; then
          echo "FAIL: Security Group no creado"
          exit 1
        fi
        echo "PASS: Security Group $SECURITY_GROUP_ID creado"
        
        # Test 8: Limpieza del recurso de prueba
        echo "[TEST 8] Limpiando recurso de prueba..."
        kubectl delete network test-network-provisioning --wait=true --timeout=120s
        echo "PASS: Recurso limpiado"
        
        echo "=== Todas las pruebas pasaron ==="
        echo "End time: $(date -Iseconds)"
        exit 0

  - apiVersion: batch/v1
    kind: Job
    metadata:
      name: crossplane-provisioning-test-runner
      namespace: crossplane-system
      labels:
        app: crossplane-provisioning-validation
        test-type: integration
        test-runner: fintech-control-plane
      annotations:
        description: "Job que ejecuta tests de provisionamiento Crossplane"
        maintainer: "platform-team@fintech.internal"
    spec:
      ttlSecondsAfterFinished: 3600
      backoffLimit: 2
      template:
        metadata:
          labels:
            app: crossplane-provisioning-validation
        spec:
          serviceAccountName: crossplane-provider-aws
          restartPolicy: OnFailure
          containers:
            - name: test-runner
              image: crossplane/provider-aws:v1.14.0
              imagePullPolicy: IfNotPresent
              command:
                - /bin/bash
                - /scripts/test-script.sh
              env:
                - name: AWS_REGION
                  value: "us-east-1"
                - name: AWS_ACCESS_KEY_ID
                  valueFrom:
                    secretKeyRef:
                      name: aws-provider-creds
                      key: credentials
                      optional: true
              volumeMounts:
                - name: test-script
                  mountPath: /scripts
                  readOnly: true
              resources:
                requests:
                  memory: "512Mi"
                  cpu: "250m"
                limits:
                  memory: "1Gi"
                  cpu: "1000m"
          volumes:
            - name: test-script
              configMap:
                name: crossplane-provisioning-test-assertions
                defaultMode: 0755

  - apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: crossplane-provisioning-test-runner
      namespace: crossplane-system
      labels:
        app: crossplane-provisioning-validation
      annotations:
        description: "Service account para ejecutar tests de provisioning Crossplane"

  - apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      name: crossplane-provisioning-test-runner
      namespace: crossplane-system
      labels:
        app: crossplane-provisioning-validation
    rules:
      - apiGroups: ["*"]
        resources: ["*"]
        verbs: ["get", "list", "watch", "create", "update", "delete"]
      - apiGroups: ["apiextensions.k8s.io"]
        resources: ["compositeresourcedefinitions", "compositions"]
        verbs: ["get", "list"]
      - apiGroups: ["network.fintech.internal"]
        resources: ["networks"]
        verbs: ["*"]

  - apiVersion: rbac.authorization.k8s.io/v1
    kind: RoleBinding
    metadata:
      name: crossplane-provisioning-test-runner
      namespace: crossplane-system
      labels:
        app: crossplane-provisioning-validation
    subjects:
      - kind: ServiceAccount
        name: crossplane-provisioning-test-runner
        namespace: crossplane-system
    roleRef:
      kind: Role
      name: crossplane-provisioning-test-runner
      apiGroup: rbac.authorization.k8s.io

---

// === ARCHIVO: tests/vault-secrets-test.yaml ===
apiVersion: v1
kind: List
items:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: vault-secrets-test-assertions
      namespace: external-secrets
      labels:
        app: vault-secrets-validation
        test-runner: fintech-control-plane
      annotations:
        description: "Validaciones de sincronizacion de secrets con Vault y external-secrets"
        maintainer: "platform-team@fintech.internal"
    data:
      test-script.sh: |
        #!/bin/bash
        set -euo pipefail
        
        # Test: Verificar sincronizacion de secrets entre Vault y Kubernetes
        readonly VAULT_ADDR="https://vault.fintech.internal:8200"
        readonly SECRET_STORE_NAME="vault-secrets-store"
        readonly TEST_NAMESPACE="fintech-app"
        readonly TEST_SECRET_NAME="test-api-key"
        readonly VAULT_PATH="secret/data/fintech/api-keys"
        readonly SYNC_TIMEOUT=180
        
        echo "=== Vault + External Secrets Test Suite ==="
        echo "Start time: $(date -Iseconds)"
        
        # Test 1: Verificar que SecretStore esta configurado y disponible
        echo "[TEST 1] Verificando SecretStore..."
        kubectl get secretstores -A
        
        SECRET_STORE_STATUS=$(kubectl get secretstore $SECRET_STORE_NAME -n external-secrets -o jsonpath='{.status.conditions[0].status}' 2>/dev/null || echo "NotFound")
        if [ "$SECRET_STORE_STATUS" != "True" ]; then
          echo "FAIL: SecretStore $SECRET_STORE_NAME no esta disponible"
          kubectl get secretstore $SECRET_STORE_NAME -n external-secrets -o yaml
          exit 1
        fi
        echo "PASS: SecretStore $SECRET_STORE_NAME esta disponible"
        
        # Test 2: Verificar ClusterSecretStore si existe
        echo "[TEST 2] Verificando ClusterSecretStore..."
        if kubectl get clustersecretstore vault-secrets > /dev/null 2>&1; then
          CLUSTER_SECRET_STORE_STATUS=$(kubectl get clustersecretstore vault-secrets -o jsonpath='{.status.conditions[0].status}')
          if [ "$CLUSTER_SECRET_STORE_STATUS" != "True" ]; then
            echo "FAIL: ClusterSecretStore no esta healthy"
            exit 1
          fi
          echo "PASS: ClusterSecretStore esta healthy"
        else
          echo "INFO: ClusterSecretStore no existe, usando SecretStore.namespaced"
        fi
        
        # Test 3: Verificar que el secret de prueba existe en Vault
        echo "[TEST 3] Verificando secreto en Vault..."
        # Usando Vault CLI o API REST
        if command -v vault &> /dev/null; then
          VAULT_TOKEN=$(cat /vault/secrets/token 2>/dev/null || echo "")
          if [ -n "$VAULT_TOKEN" ]; then
            export VAULT_TOKEN
            if ! vault kv get -field=api_key $VAULT_PATH > /dev/null 2>&1; then
              echo "WARN: Secreto no existe en Vault, creando..."
              vault kv put $VAULT_PATH api_key="test-key-$(date +%s)" environment="test"
            fi
            echo "PASS: Secreto verificado en Vault"
          else
            echo "WARN: Token de Vault no disponible, saltando verificacion directa"
          fi
        else
          echo "WARN: Vault CLI no disponible en el test runner"
        fi
        
        # Test 4: Crear ExternalSecret y verificar sincronizacion
        echo "[TEST 4] Creando ExternalSecret para sincronizacion..."
        cat <<EOF | kubectl apply -f -
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: $TEST_SECRET_NAME
  namespace: $TEST_NAMESPACE
  labels:
    app: fintech-app
    test: integration
    managed-by: external-secrets
spec:
  refreshInterval: 1h
  secretStoreRef:
    name: $SECRET_STORE_NAME
    kind: SecretStore
  target:
    name: $TEST_SECRET_NAME
    creationPolicy: Owner
  data:
    - secretKey: api_key
      remoteRef:
        key: $VAULT_PATH
        property: api_key
    - secretKey: environment
      remoteRef:
        key: $VAULT_PATH
        property: environment
EOF
        
        # Esperar a que el secret se sincronice
        echo "Esperando sincronizacion (timeout: ${SYNC_TIMEOUT}s)..."
        if ! kubectl wait --for=condition=SecretSynced=true externalsecret/$TEST_SECRET_NAME -n $TEST_NAMESPACE --timeout=${SYNC_TIMEOUT}s 2>/dev/null; then
          echo "FAIL: Timeout esperando sincronizacion del secret"
          kubectl get externalsecret $TEST_SECRET_NAME -n $TEST_NAMESPACE -o yaml
          exit 1
        fi
        echo "PASS: ExternalSecret sincronizado"
        
        # Test 5: Verificar que el Secret fue creado en Kubernetes
        echo "[TEST 5] Verificando Secret creado en Kubernetes..."
        if ! kubectl get secret $TEST_SECRET_NAME -n $TEST_NAMESPACE > /dev/null 2>&1; then
          echo "FAIL: Secret $TEST_SECRET_NAME no fue creado en namespace $TEST_NAMESPACE"
          exit 1
        fi
        echo "PASS: Secret $TEST_SECRET_NAME creado"
        
        # Test 6: Verificar contenido del Secret
        echo "[TEST 6] Verificando contenido del Secret..."
        API_KEY=$(kubectl get secret $TEST_SECRET_NAME -n $TEST_NAMESPACE -o jsonpath='{.data.api_key}' | base64 -d)
        if [ -z "$API_KEY" ]; then
          echo "FAIL: Campo api_key no encontrado en el Secret"
          exit 1
        fi
        echo "PASS: api_key presente en el Secret"
        
        ENVIRONMENT=$(kubectl get secret $TEST_SECRET_NAME -n $TEST_NAMESPACE -o jsonpath='{.data.environment}' | base64 -d)
        if [ -z "$ENVIRONMENT" ]; then
          echo "FAIL: Campo environment no encontrado en el Secret"
          exit 1
        fi
        echo "PASS: environment presente en el Secret"
        
        # Test 7: Verificar que los cambios en Vault se reflejan automaticamente
        echo "[TEST 7] Verificando actualizacion automatica..."
        # Obtener el annotation de ultima actualizacion
        LAST_SYNC=$(kubectl get secret $TEST_SECRET_NAME -n $TEST_NAMESPACE -o jsonpath='{.metadata.annotations.external-secrets\.io/last-sync-timestamp}')
        if [ -z "$LAST_SYNC" ]; then
          echo "FAIL: Annotation de ultima sincronizacion no encontrada"
          exit 1
        fi
        echo "PASS: Ultima sincronizacion: $LAST_SYNC"
        
        # Test 8: Verificar ClusterSecretStore con multiples namespaces
        echo "[TEST 8] Verificando acceso a multiplos namespaces..."
        # Verificar que external-secrets tiene permisos en los namespaces objetivo
        for ns in fintech-app fintech-backend fintech-data; do
          if kubectl get namespace $ns > /dev/null 2>&1; then
            echo "  Verificando namespace: $ns"
            # El SecretStore debe tener acceso al namespace
            echo "  PASS: Namespace $ns accesible"
          fi
        done
        
        # Test 9: Verificar manejo de errores cuando Vault no esta disponible
        echo "[TEST 9] Verificando manejo de errores..."
        # Crear un ExternalSecret con path invalido
        cat <<EOF | kubectl apply -f -
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: test-invalid-secret
  namespace: $TEST_NAMESPACE
spec:
  refreshInterval: 1h
  secretStoreRef:
    name: $SECRET_STORE_NAME
    kind: SecretStore
  target:
    name: test-invalid-secret
    creationPolicy: Owner
  data:
    - secretKey: invalid_key
      remoteRef:
        key: secret/data/nonexistent/path
        property: key
EOF
        
        # Esperar un poco y verificar que el secret no se creo
        sleep 10
        if kubectl get secret test-invalid-secret -n $TEST_NAMESPACE > /dev/null 2>&1; then
          echo "FAIL: Secret invalido deberia haber fallado"
          kubectl delete externalsecret test-invalid-secret -n $TEST_NAMESPACE
          exit 1
        fi
        echo "PASS: Error manejado correctamente para secreto inexistente"
        kubectl delete externalsecret test-invalid-secret -n $TEST_NAMESPACE --ignore-not-found=true
        
        # Test 10: Limpieza de recursos de prueba
        echo "[TEST 10] Limpiando recursos de prueba..."
        kubectl delete externalsecret $TEST_SECRET_NAME -n $TEST_NAMESPACE --wait=true
        kubectl delete secret $TEST_SECRET_NAME -n $TEST_NAMESPACE --ignore-not-found=true
        echo "PASS: Recursos limpiados"
        
        echo "=== Todas las pruebas pasaron ==="
        echo "End time: $(date -Iseconds)"
        exit 0

  - apiVersion: batch/v1
    kind: Job
    metadata:
      name: vault-secrets-test-runner
      namespace: external-secrets
      labels:
        app: vault-secrets-validation
        test-type: integration
        test-runner: fintech-control-plane
      annotations:
        description: "Job que ejecuta tests de sincronizacion Vault + external-secrets"
        maintainer: "platform-team@fintech.internal"
    spec:
      ttlSecondsAfterFinished: 3600
      backoffLimit: 2
      template:
        metadata:
          labels:
            app: vault-secrets-validation
        spec:
          serviceAccountName: external-secrets-sa
          restartPolicy: OnFailure
          containers:
            - name: test-runner
              image: hashicorp/vault:1.15.0
              imagePullPolicy: IfNotPresent
              command:
                - /bin/bash
                - /scripts/test-script.sh
              env:
                - name: VAULT_ADDR
                  value: "https://vault.fintech.internal:8200"
                - name: VAULT_SKIP_VERIFY
                  value: "true"
              volumeMounts:
                - name: test-script
                  mountPath: /scripts
                  readOnly: true
                - name: vault-secrets
                  mountPath: /vault/secrets
                  readOnly: true
              resources:
                requests:
                  memory: "256Mi"
                  cpu: "100m"
                limits:
                  memory: "512Mi"
                  cpu: "500m"
          volumes:
            - name: test-script
              configMap:
                name: vault-secrets-test-assertions
                defaultMode: 0755
            - name: vault-secrets
              secret:
                secretName: vault-token
                optional: true

  - apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: vault-secrets-test-runner
      namespace: external-secrets
      labels:
        app: vault-secrets-validation
      annotations:
        description: "Service account para ejecutar tests de Vault + external-secrets"

  - apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      name: vault-secrets-test-runner
      namespace: external-secrets
      labels:
        app: vault-secrets-validation
    rules:
      - apiGroups: ["external-secrets.io"]
        resources: ["externalsecrets", "secretstores", "clustersecretstores"]
        verbs: ["get", "list", "watch", "create", "update", "delete"]
      - apiGroups: [""]
        resources: ["secrets"]
        verbs: ["get", "list", "watch", "create", "update", "delete"]
      - apiGroups: [""]
        resources: ["namespaces"]
        verbs: ["get", "list"]

  - apiVersion: rbac.authorization.k8s.io/v1
    kind: RoleBinding
    metadata:
      name: vault-secrets-test-runner
      namespace: external-secrets
      labels:
        app: vault-secrets-validation
    subjects:
      - kind: ServiceAccount
        name: vault-secrets-test-runner
        namespace: external-secrets
    roleRef:
      kind: Role
      name: vault-secrets-test-runner
      apiGroup: rbac.authorization.k8s.io


// === ARCHIVO: docs/topologia-replicacion-estado.md ===
# Topología de Replicación de Estado para Multi-Cluster Kubernetes

## Contexto del Problema

En una arquitectura fintech con 12 clusters Kubernetes distribuidos en 4 regiones de AWS, la consistencia del estado es crítica para garantizar la integridad de las transacciones financieras y la disponibilidad del servicio. La elección de la topología de replicación impacta directamente en la latencia, la consistencia de datos y la capacidad de recuperación ante desastres.

## Análisis de Topologías Disponibles

### Líder-Seguidor (Primary-Replica)

En esta configuración, existe un cluster primario que acepta operaciones de escritura y uno o más clusters secundarios que replican el estado de forma asíncrona. El cluster primario es la única fuente de verdad y los seguidores reciben actualizaciones periódicas.

**Ventajas:**
- Simplicidad en la resolución de conflictos: solo el líder escribe
- Menor latencia de escritura (operaciones locales)
- fácil de implementar y mantener
- Consistencia eventual controlada y predecible

**Desventajas:**
- El failover requiere promoción manual o automática del secundario
- Pérdida potencial de datos si el líder falla antes de replicar
- Latencia de lectura en seguidores para datos recientes
- Punto único de fallo en el líder si no hay múltiples seguidores

### Multi-Maestro (Multi-Primary)

Múltiples clusters pueden aceptar escrituras simultáneamente. Cada maestro replica sus cambios a los demás. Esta topología es más compleja pero ofrece mayor disponibilidad.

**Ventajas:**
- Escritura local en cualquier región, minimizando latencia
- Tolerancia a fallos mayor: si un maestro falla, los demás siguen operando
- Balanceo de carga entre regiones
- Recuperación más rápida ante desastres regionales

**Desventajas:**
- Conflictos de escritura simultánea requieren resolución
- Mayor complejidad en la implementación de etcd
- Consistencia eventual por defecto, puede haber divergencias
- Requiere configuración de quorum y split-brain prevention

## Justificación de la Elección para Fintech

### Selección: Líder-Seguidor con Failover Automatizado

Para este caso de uso fintech con 12 clusters en 4 regiones, se recomienda una topología líder-seguidor por las siguientes razones:

**1. Consistencia financiera:** En entornos fintech, la consistencia de los datos es más crítica que la disponibilidad inmediata. Las transacciones financieras requieren un orden total y no pueden tolerar conflictos de escritura que podrían resultar en estados inconsistentes del ledger.

**2. Complejidad controlada:** La arquitectura líder-seguidor reduce significativamente la complejidad operativa. Los equipos de infraestructura pueden focalizarse en optimizar la replicación y el failover en lugar de gestionar conflictos de escritura.

**3. Compliance regulatorio:** Los reguladores financieros suelen exigir auditoría completa y trazabilidad de todas las operaciones. Un modelo con líder claro simplifica la correlación de eventos y el análisis forense.

**4. Latencia aceptable:** Con etcd en modo líder-seguidor y replicación asíncrona, la latencia de escritura se mantiene local (milisegundos) mientras que la replicación ocurre en background. Para la mayoría de operaciones financieras, esta consistencia eventual es aceptable.

## Implementación Recomendada

### Configuración de etcd

Los clusters etcd de cada región se configuran con replication factor 3 dentro de la misma región, y un mecanismo de replicación cross-region hacia el cluster primario. Se utiliza etcd-operator o el operador de etcd de Banzaicloud para gestionar la replicación.

### Failover Automatizado

El controlador de failover implementado como CRD monitoriza la salud del líder y-promueve automáticamente un sekundär cuando el primario no responde. Se implementa protección contra split-brain mediante un锁 distribuida con etcd o mediante Vault como coordinador.

### Topología Física

```
Región us-east-1 (Primario)
├── Cluster Kubernetes Primary
├── etcd cluster (3 nodos)
└── Vault Primary

Región us-west-2 (Secundario)
├── Cluster Kubernetes Standby-1
├── etcd replica
└── Vault Replica

Región eu-west-1 (Secundario)
├── Cluster Kubernetes Standby-2
├── etcd replica
└── Vault Replica

Región ap-southeast-1 (Secundario)
├── Cluster Kubernetes Standby-3
├── etcd replica
└── Vault Replica
```

## Métricas de Monitoreo

- Lag de replicación entre líder y seguidores (target: < 1 segundo)
- Tiempo de detección de fallo del líder (target: < 30 segundos)
- Tiempo de promoción de nuevo líder (target: < 2 minutos)
- Consistencia de datos post-failover (verificaciones periódicas)
- Throughput de operaciones de escritura por segundo

## Conclusión

La topología líder-seguidor proporciona el equilibrio óptimo entre consistencia, disponibilidad y complejidad operativa para un entorno fintech. La implementación de failover automatizado mediante un controlador custom asegura que la recuperación ante desastres sea rápida y predecible, cumpliendo con los SLAs de disponibilidad requeridos por el negocio.

// === ARCHIVO: docs/comparativa-gitops-herramientas.md ===
# Comparativa de Herramientas GitOps: ArgoCD vs Flux vs Rancher Fleet

## Introducción

En el ecosistema de Kubernetes, GitOps se ha convertido en el paradigma dominante para la gestión declarativa de infraestructura y aplicaciones. Esta documentación compara las tres herramientas principales del mercado para ayudarte a tomar una decisión informada sobre cuál adoptar en tu control plane multi-cluster.

## Visión General de las Herramientas

### ArgoCD

ArgoCD es una herramienta de entrega continua declarativa para Kubernetes que sigue el patrón GitOps. Utiliza un controlador que monitorea continuamente el estado de los recursos en Git y sincroniza automáticamente los cambios hacia los clusters.

**Características principales:**
- Interfaz de usuario web completa con visualización del estado de aplicaciones
- Soporte nativo para aplicaciones multi-tenancy
- Políticas de sincronización granular (automática, manual, prune)
- Rollback automático y historial de versiones
- Integración con múltiples clusters
- Resource health tracking avanzado
- Soporte para Helm, Kustomize, Plain YAML, Jsonnet

### Flux

Flux es una herramienta de GitOps originalmente desarrollada por Weaveworks y posteriormente donada a la CNCF. Utiliza un modelo de operadores para sincronizar el estado de Git hacia Kubernetes.

**Características principales:**
- Diseño minimalista y modular
- Fuerte integración con el ecosistema Helm
- Bootstrap simplificado con flux bootstrap
- Soporte para multi-tenancy mediante Flux API
- Image automation para actualizaciones automáticas de imágenes
- Reconciliation de recursos con CRDs
- Comunidad activa y adopción creciente

### Rancher Fleet

Rancher Fleet es la solución de gestión de clusters de Rancher Labs (SUSE). Está diseñado para gestionar miles de clusters desde una única interfaz.

**Características principales:**
- Gestión de múltiples clusters a escala
- Soporte para clusters que no son Kubernetes (EKS, AKS, GKE management)
- Bundles para distribución de configuraciones
- GitRepo abstraction para organizar recursos
- Integración nativa con Rancher
- Target customization por cluster
- Drift detection y corrección

## Matriz de Comparación

| Característica | ArgoCD | Flux | Rancher Fleet |
|----------------|--------|------|---------------|
| Multi-cluster nativo | ★★★★★ | ★★★★☆ | ★★★★★ |
| Interfaz UI | ★★★★★ | ★★☆☆☆ | ★★★★☆ |
| Multi-tenancy | ★★★★★ | ★★★☆☆ | ★★★★☆ |
| comunidad CNCF | ★★★★★ | ★★★★★ | ★★★☆☆ |
| Curva de aprendizaje | ★★★☆☆ | ★★★★☆ | ★★★☆☆ |
| Helm support | ★★★★★ | ★★★★★ | ★★★★☆ |
| Kustomize support | ★★★★★ | ★★★★☆ | ★★★★☆ |
| Enterprise support | ★★★★★ | ★★★★☆ | ★★★★★ |
| Custom resources | ★★★★★ | ★★★★☆ | ★★★☆☆ |
| Rollback automático | ★★★★★ | ★★★☆☆ | ★★★★☆ |
| Performance escala | ★★★★☆ | ★★★★★ | ★★★★★ |

## Análisis Detallado

### Facilidad de Uso y Curva de Aprendizaje

ArgoCD ofrece la experiencia más completa desde el primer momento. Su interfaz web permite visualizar el estado de las aplicaciones, ver diffs, ejecutar sincronizaciones y realizar rollbacks sin necesidad de herramientas de CLI. Sin embargo, esta riqueza tiene un costo en complejidad de configuración inicial.

Flux es más minimalista y se integra naturalmente con flujos de trabajo basados en CLI. La configuración mediante CRDs es intuitiva para desarrolladores familiarizados con Kubernetes. La ausencia de UI puede ser una limitación para equipos que prefieren interfaces visuales.

Rancher Fleet requiere la infraestructura de Rancher para aprovechar todas sus capacidades. Si ya se utiliza Rancher, la integración es seamless; si no, añade una capa de complejidad significativa.

### Multi-Cluster y Multi-Tenancy

Para el caso de 12 clusters en 4 regiones, ArgoCD destaca por su capacidad de gestionar múltiples clusters desde una única instalación. El modelo de ApplicationSet con generators permite gestionar aplicaciones en múltiples destinos de forma declarativa. La autenticación integrada con OAuth/OIDC y el RBAC granular lo hacen ideal para equipos grandes.

Flux puede gestionar múltiples clusters mediante flux-multi-tenancy o instalando múltiples instancias. La complejidad aumenta proporcionalmente con el número de clusters.

Rancher Fleet está diseñado específicamente para gestión masiva de clusters, pero requiere la infraestructura completa de Rancher.

### Comunidad y Ecosistema

ArgoCD cuenta con el respaldo de Argo Project, tiene adopción masiva en producción y documentación extensiva. La integración con otras herramientas del ecosistema (Argo Rollouts, Argo Events) proporciona capacidades adicionales de entrega progressive y event-driven.

Flux es un proyecto de la CNCF con una comunidad activa. La integración con GitHub Actions y otros CI/CD tools es excelente.

Rancher Fleet tiene soporte empresarial de SUSE pero menor adopción en la comunidad open source.

## Justificación de la Elección: ArgoCD

### Razones Técnicas

**1. Interfaz de usuario completa:** Para operaciones multi-cluster en un entorno fintech, tener visibilidad del estado de todas las aplicaciones en todos los clusters es crítico. La UI de ArgoCD permite identificar problemas rapidamente y ejecutar acciones correctivas sin necesidad de acceso SSH a clusters.

**2. ApplicationSet:** El patrón ApplicationSet de ArgoCD permite gestionar la proliferación de aplicaciones en múltiples entornos y clusters de forma declarativa. Un único ApplicationSet puede generar aplicaciones para dev, staging, production en los 12 clusters.

**3. Resource health tracking:** ArgoCD entiende el estado de salud de recursos nativos de Kubernetes y CRDs, no solo la presencia de objetos. Esto es vital para detectar cuando un deployment está realmente sano vs cuando está en estado de error.

**4. Rollback y historial:** La capacidad de ArgoCD de mantener historial de sincronización y realizar rollbacks con un solo click es esencial para recuperación ante desastres y resolución rápida de problemas.

**5. Integración con herramientas de seguridad:** Soporte nativo para sigstore (FUTURE: firma de imágenes), integración con Vault para secrets, y políticas de sincronización que pueden restringir operaciones destructivas.

### Razones Organizacionales

- Equipo existente familiarizado con ArgoCD en otros proyectos
- Documentación extensa y comunidad activa
- Riesgo reducido de vendor lock-in al ser proyecto de código abierto
- Compatible con la estrategia de certificación del equipo

## Recomendaciones de Implementación

### Arquitectura de Instalación

Se recomienda una instalación centralizada de ArgoCD que gestione los 12 clusters. Los clusters de producción pueden tener un ArgoCD local para operaciones de emergencia si la conectividad al control plane se pierde.

### Patrón de Aplicaciones

- Una aplicación por microservicio por entorno
- ApplicationSets con matrix generator para combinación entorno-cluster
- Git repositories separados por equipo de servicio
- Políticas de sync: automatico para dev, manual para staging y prod

### Integraciones Recomendadas

- Prometheus metrics para monitoreo
- Slack/Teams para notificaciones de sync
- Vault para secrets via external-secrets
- ArgoCD notifications para alertas

## Conclusión

Para este caso de uso fintech con 12 clusters en 4 regiones, ArgoCD proporciona el balance óptimo entre capacidades, ease of use y madurez. Su soporte nativo multi-cluster, interfaz de usuario completa y modelo de seguridad robusto lo hacen la elección correcta para un entorno que requiere alta disponibilidad y compliance regulatorio.

// === ARCHIVO: docs/modelo-rbac-federado.md ===
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


// === ARCHIVO: docs/estrategia-secrets.md ===
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

// === ARCHIVO: docs/coreografia-disaster-recovery.md ===
# Coreografía de Disaster Recovery

## Descripción General

Este documento detalla la coreografía implementada para el procedimiento de Disaster Recovery (DR) en el control plane multi-cluster de Fintech. La arquitectura está diseñada para garantizar recuperación ante fallos catastróficos en cualquier región, minimizando el RTO (Recovery Time Objective) y RPO (Recovery Point Objective).

## Topología de Clusters

La infraestructura cuenta con:
- **Cluster Primario**: Ubicado en us-east-1, gestiona el tráfico de producción
- **Standby Activo**: Located in us-west-2, recibe replicación síncrona
- **Standby Pasivo**: En eu-west-1, recibe replicación asíncrona para recuperación geográfica

## Estados del Sistema DR

El sistema define tres estados operativos principales:
1. **Normal**: Operación primaria con tráfico en us-east-1
2. **Degradado**: Detección de fallo parcial con failover automático
3. **Recuperación**: Restauración del cluster primario desde backup

## Mecanismos de Detección de Fallos

### Health Checks Distribuidos

Los health checks monitorean múltiples componentes:
- Endpoint de API de Kubernetes
- Conectividad a etcd
- Estado de ArgoCD
- Latencia de red entre regiones
- Disponibilidad de servicios críticos

### Controller de Failover

El FailoverController es un Custom Resource Definition que orquesta la transición entre estados:

```yaml
apiVersion: disaster-recovery.fintech.io/v1
kind: FailoverAction
metadata:
  name: primary-failover
spec:
  sourceCluster: primary
  targetCluster: standby-us-west-2
  triggerCondition: health-check-failure
  autoApprove: false
```

## Prevención de Split-Brain

El escenario de split-brain ocurre cuando los clusters primario y standby creen simultáneamente ser el primario. La arquitectura implementa múltiples mecanismos para prevenirlo:

### Bloqueo Mutuo con Lease

El AntiSplitBrainController mantiene un lease en etcd que expira si el controller no renueva cada 10 segundos. Solo el cluster con lease válido puede aceptar tráfico.

### Arbiter Externo

Un componente externo en AWS (Lambda) actúa como árbitro: evalúa señales de salud de ambos clusters y decide cuál debe estar activo. La decisión se escribe en un bucket de S3 que ambos clusters monitorean.

### Secuencia de Failover

1. Health check detecta fallo en cluster primario
2. FailoverController intenta adquirir lease en etcd
3. Si el lease se adquiere, se procede al failover
4. Se actualiza el DNS para apuntar al cluster standby
5. ArgoCD sincroniza el estado al cluster activo
6. Los servicios externos son notificados del cambio

## Procedimiento de Rollback

El rollback al cluster primario restaurado sigue la secuencia inversa:

1. Verificación de salud del cluster primario
2. Detención de tráfico hacia standby
3. Sincronización final de datos desde standby
4. Actualización de DNS al cluster primario
5. Reconocimiento del cluster primario en el lease
6. Monitoreo de estabilidad durante 30 minutos

## RTO y RPO Objetivos

- **RTO**: 5 minutos para failover automático
- **RTO**: 15 minutos para failover manual
- **RPO**: 0 datos perdidos con replicación síncrona
- **RPO**: Máximo 1 minuto con replicación asíncrona

## Referencias

- Patrones de disaster recovery en Kubernetes: https://kubernetes.io/docs/concepts/cluster-administration/failover/
- Diseño de sistemas distribuidos tolerantes a fallos: https://aws.amazon.com/architecture/well-architected/
- etcd Raft Consensus: https://etcd.io/docs/v3.5/learning/technical/


// === ARCHIVO: aws/iam-policy.json ===
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CrossplaneProviderIAM",
      "Effect": "Allow",
      "Action": [
        "iam:CreateRole",
        "iam:DeleteRole",
        "iam:GetRole",
        "iam:ListRolePolicies",
        "iam:ListAttachedRolePolicies",
        "iam:PutRolePolicy",
        "iam:DeleteRolePolicy",
        "iam:GetRolePolicy",
        "iam:AttachRolePolicy",
        "iam:DetachRolePolicy",
        "iam:CreateInstanceProfile",
        "iam:DeleteInstanceProfile",
        "iam:GetInstanceProfile",
        "iam:AddRoleToInstanceProfile",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:CreateServiceLinkedRole",
        "iam:PassRole"
      ],
      "Resource": [
        "arn:aws:iam::*:role/crossplane-*",
        "arn:aws:iam::*:instance-profile/crossplane-*"
      ],
      "Condition": {
        "StringLike": {
          "aws:RequestTag/managed-by": "crossplane"
        }
      },
      "Comment": "Permite a Crossplane gestionar roles e instance profiles necesarios para proveedor AWS. Requiere tagging para auditoría."
    },
    {
      "Sid": "CrossplaneProviderEKS",
      "Effect": "Allow",
      "Action": [
        "eks:CreateCluster",
        "eks:DeleteCluster",
        "eks:DescribeCluster",
        "eks:ListClusters",
        "eks:UpdateClusterConfig",
        "eks:UpdateClusterVersion",
        "eks:CreateNodegroup",
        "eks:DeleteNodegroup",
        "eks:DescribeNodegroup",
        "eks:ListNodegroups",
        "eks:UpdateNodegroupConfig",
        "eks:UpdateNodegroupVersion",
        "eks:AssociateEncryptionConfig",
        "eks:AssociateIdentityProviderConfig",
        "eks:CreateFargateProfile",
        "eks:DeleteFargateProfile",
        "eks:DescribeFargateProfile",
        "eks:ListFargateProfiles",
        "eks:CreateAddon",
        "eks:DeleteAddon",
        "eks:DescribeAddon",
        "eks:ListAddons",
        "eks:UpdateAddon",
        "eks:DescribeIdentityProviderConfig",
        "eks:ListIdentityProviderConfigs"
      ],
      "Resource": "arn:aws:eks:*:*:cluster/*",
      "Comment": "Permite provisión y gestión de clusters EKS y sus componentes (nodegroups, addons, Fargate profiles).""
    },
    {
      "Sid": "CrossplaneProviderRDS",
      "Effect": "Allow",
      "Action": [
        "rds:CreateDBInstance",
        "rds:DeleteDBInstance",
        "rds:DescribeDBInstances",
        "rds:DescribeDBEngineVersions",
        "rds:ModifyDBInstance",
        "rds:RebootDBInstance",
        "rds:CreateDBCluster",
        "rds:DeleteDBCluster",
        "rds:DescribeDBClusters",
        "rds:ModifyDBCluster",
        "rds:CreateDBSubnetGroup",
        "rds:DeleteDBSubnetGroup",
        "rds:DescribeDBSubnetGroups",
        "rds:CreateDBParameterGroup",
        "rds:DeleteDBParameterGroup",
        "rds:DescribeDBParameterGroups",
        "rds:ModifyDBParameterGroup",
        "rds:CreateDBOptionGroup",
        "rds:DeleteDBOptionGroup",
        "rds:DescribeDBOptionGroups",
        "rds:AddTagsToResource",
        "rds:RemoveTagsFromResource",
        "rds:ListTagsForResource",
        "rds:DescribePendingMaintenanceActions",
        "rds:PromoteReadReplica",
        "rds:CreateGlobalReplicationGroup",
        "rds:DescribeGlobalReplicationGroups",
        "rds:DeleteGlobalReplicationGroup"
      ],
      "Resource": [
        "arn:aws:rds:*:*:db:*",
        "arn:aws:rds:*:*:cluster:*",
        "arn:aws:rds:*:*:subgrp:*",
        "arn:aws:rds:*:*:pg:*",
        "arn:aws:rds:*:*:og:*",
        "arn:aws:rds:*:*:gr:*"
      ],
      "Comment": "Permite gestión de instancias y clusters RDS incluyendo bases de datos PostgreSQL/MySQL para aplicaciones fintech."
    },
    {
      "Sid": "CrossplaneProviderS3",
      "Effect": "Allow",
      "Action": [
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:ListBucket",
        "s3:GetBucketLocation",
        "s3:GetBucketVersioning",
        "s3:PutBucketVersioning",
        "s3:GetBucketOwnershipControls",
        "s3:PutBucketOwnershipControls",
        "s3:GetBucketPublicAccessBlock",
        "s3:PutBucketPublicAccessBlock",
        "s3:PutBucketPolicy",
        "s3:GetBucketPolicy",
        "s3:DeleteBucketPolicy",
        "s3:PutBucketTagging",
        "s3:GetBucketTagging",
        "s3:PutEncryptionConfiguration",
        "s3:GetEncryptionConfiguration",
        "s3:PutLifecycleConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:PutReplicationConfiguration",
        "s3:GetReplicationConfiguration",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:PutObjectAcl",
        "s3:GetObjectAcl",
        "s3:PutObjectVersionAcl",
        "s3:GetObjectVersionAcl"
      ],
      "Resource": [
        "arn:aws:s3:::fintech-*",
        "arn:aws:s3:::fintech-*/*"
      ],
      "Comment": "Permite gestión de buckets S3 para almacenamiento de estado, artefactos y logs con replicación cross-region."
    },
    {
      "Sid": "CrossplaneProviderVPC",
      "Effect": "Allow",
      "Action": [
        "ec2:CreateVpc",
        "ec2:DeleteVpc",
        "ec2:DescribeVpcs",
        "ec2:ModifyVpcAttribute",
        "ec2:CreateSubnet",
        "ec2:DeleteSubnet",
        "ec2:DescribeSubnets",
        "ec2:ModifySubnetAttribute",
        "ec2:CreateInternetGateway",
        "ec2:DeleteInternetGateway",
        "ec2:DescribeInternetGateways",
        "ec2:AttachInternetGateway",
        "ec2:DetachInternetGateway",
        "ec2:CreateNatGateway",
        "ec2:DeleteNatGateway",
        "ec2:DescribeNatGateways",
        "ec2:CreateRouteTable",
        "ec2:DeleteRouteTable",
        "ec2:DescribeRouteTables",
        "ec2:CreateRoute",
        "ec2:DeleteRoute",
        "ec2:CreateSecurityGroup",
        "ec2:DeleteSecurityGroup",
        "ec2:DescribeSecurityGroups",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:AuthorizeSecurityGroupEgress",
        "ec2:RevokeSecurityGroupIngress",
        "ec2:RevokeSecurityGroupEgress",
        "ec2:CreateNetworkAcl",
        "ec2:DeleteNetworkAcl",
        "ec2:DescribeNetworkAcls",
        "ec2:CreateNetworkAclEntry",
        "ec2:DeleteNetworkAclEntry",
        "ec2:CreateVpcEndpoint",
        "ec2:DeleteVpcEndpoints",
        "ec2:DescribeVpcEndpoints",
        "ec2:CreateEgressOnlyInternetGateway",
        "ec2:DescribeEgressOnlyInternetGateways"
      ],
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:RequestTag/environment": ["dev", "staging", "prod"]
        }
      },
      "Comment": "Permite gestión completa de VPCs, subnets, gateways, routing y security groups. Limitado a entornos etiquetados."
    },
    {
      "Sid": "CrossplaneProviderElastiCache",
      "Effect": "Allow",
      "Action": [
        "elasticache:CreateCacheCluster",
        "elasticache:DeleteCacheCluster",
        "elasticache:DescribeCacheClusters",
        "elasticache:ModifyCacheCluster",
        "elasticache:RebootCacheCluster",
        "elasticache:CreateCacheSubnetGroup",
        "elasticache:DeleteCacheSubnetGroup",
        "elasticache:DescribeCacheSubnetGroups",
        "elasticache:CreateCacheParameterGroup",
        "elasticache:DeleteCacheParameterGroup",
        "elasticache:DescribeCacheParameterGroups",
        "elasticache:ModifyCacheParameterGroup",
        "elasticache:CreateReplicationGroup",
        "elasticache:DeleteReplicationGroup",
        "elasticache:DescribeReplicationGroups",
        "elasticache:ModifyReplicationGroup",
        "elasticache:DescribeEngineDefaultParameters"
      ],
      "Resource": "*",
      "Comment": "Permite gestión de clusters ElastiCache Redis/Memcached para caching de sesiones y datos de aplicación."
    },
    {
      "Sid": "CrossplaneProviderSecretsManager",
      "Effect": "Allow",
      "Action": [
        "secretsmanager:CreateSecret",
        "secretsmanager:DeleteSecret",
        "secretsmanager:DescribeSecret",
        "secretsmanager:GetSecretValue",
        "secretsmanager:PutSecretValue",
        "secretsmanager:UpdateSecret",
        "secretsmanager:TagResource",
        "secretsmanager:UntagResource",
        "secretsmanager:ListSecrets",
        "secretsmanager:ListSecretVersionIds",
        "secretsmanager:RotateSecret",
        "secretsmanager:GetRandomPassword"
      ],
      "Resource": "arn:aws:secretsmanager:*:*:secret:fintech/*",
      "Comment": "Permite gestión de secrets en Secrets Manager para credenciales de bases de datos y APIs externas."
    },
    {
      "Sid": "CrossplaneProviderRoute53",
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:GetHostedZone",
        "route53:CreateHostedZone",
        "route53:DeleteHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource"
      ],
      "Resource": "arn:aws:route53:::hostedzone/*",
      "Comment": "Permite gestión de DNS para routing de tráfico entre clusters y failover geográfico."
    },
    {
      "Sid": "ArgoCDClusterAccess",
      "Effect": "Allow",
      "Action": [
        "eks:DescribeCluster",
        "eks:ListClusters",
        "eks:DescribeNodegroup",
        "eks:ListNodegroups",
        "eks:DescribeUpdate",
        "iam:GetRole",
        "iam:ListRoles",
        "sts:AssumeRole"
      ],
      "Resource": "*",
      "Comment": "Permite a ArgoCD descubrir y autenticar contra clusters EKS para sincronización de aplicaciones."
    },
    {
      "Sid": "ArgoCDVaultIntegration",
      "Effect": "Allow",
      "Action": [
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds"
      ],
      "Resource": [
        "arn:aws:secretsmanager:*:*:secret:fintech/argo/*",
        "arn:aws:secretsmanager:*:*:secret:fintech/vault/*"
      ],
      "Comment": "Permite a ArgoCD acceder a credenciales almacenadas en Secrets Manager para integración con Vault."
    },
    {
      "Sid": "ArgoCDArtifactStorage",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::fintech-argo-artifacts",
        "arn:aws:s3:::fintech-argo-artifacts/*"
      ],
      "Comment": "Permite almacenamiento y recuperación de artefactos de aplicaciones ArgoCD en S3."
    },
    {
      "Sid": "CrossplaneReadOnlyVPCPeering",
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeVpcPeeringConnections",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeRegions"
      ],
      "Resource": "*",
      "Comment": "Permite lectura de información de VPC peering y disponibilidad de zonas para planificación de red cross-region."
    },
    {
      "Sid": "CloudWatchObservability",
      "Effect": "Allow",
      "Action": [
        "cloudwatch:PutMetricData",
        "cloudwatch:GetMetricData",
        "cloudwatch:ListMetrics",
        "logs:CreateLogGroup",
        "logs:DescribeLogGroups",
        "logs:CreateLogStream",
        "logs:DescribeLogStreams",
        "logs:PutLogEvents"
      ],
      "Resource": "*",
      "Comment": "Permite envío de métricas y logs para observabilidad de componentes de infraestructura gestionados por Crossplane."
    },
    {
      "Sid": "KMSEncryption",
      "Effect": "Allow",
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey",
        "kms:ListAliases",
        "kms:ListKeys"
      ],
      "Resource": "arn:aws:kms:*:*:key/fintech-*",
      "Comment": "Permite cifrado de datos en reposo para buckets S3, databases RDS y Secrets Manager."
    },
    {
      "Sid": "AllowCrossplaneTagging",
      "Effect": "Allow",
      "Action": [
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:DescribeTags",
        "rds:AddTagsToResource",
        "rds:RemoveTagsFromResource",
        "elasticache:AddTagsToResource",
        "elasticache:RemoveTagsFromResource",
        "eks:TagResource",
        "eks:UntagResource"
      ],
      "Resource": "*",
      "Condition": {
        "ForAllValues:StringEquals": {
          "aws:TagKeys": ["managed-by", "environment", "team", "cost-center", "project"]
        }
      },
      "Comment": "Permite etiquetado de recursos creados por Crossplane para auditoría y gestión de costos. Solo etiquetas predefinidas."
    }
  ],
  "Description": "Política IAM para Fintech Multi-Cluster Control Plane con Crossplane y ArgoCD. Otorga permisos granulares para provisión de infraestructura AWS y gestión de aplicaciones GitOps en clusters EKS."
}
// === ARCHIVO: aws/health-check-listener.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: health-check-listener-config
  namespace: monitoring
  annotations:
    description: >
      Configuración de listener para health checks de clusters Kubernetes.
      Detecta fallos en clusters primario y ejecuta failover automático.
    owner: platform-team
    cost-center: "fintech-platform"
data:
  health-check-config.yaml: |
    # Configuración principal del health check listener
    # Este componente vigila la salud de todos los clusters y detecta
    # cuando un cluster deja de responder o reporta estado no healthy
    
    global:
      interval: 30s
      timeout: 10s
      retries: 3
      escalation_delay: 60s
    
    # Definición de clusters a monitorear
    clusters:
      primary:
        name: fintech-primary
        endpoint: https://eks-primary.fintech.internal:6443
        region: us-east-1
        priority: 1
        health_checks:
          - type: api-server
            path: /healthz
            expected_status: 200
          - type: etcd
            endpoint: https://etcd-primary.fintech.internal:2379/health
            expected_status: 200
          - type: node-resources
            min_ready_nodes: 2
            max_unavailable_percent: 20
          - type: pod-readiness
            namespace: critical
            min_ready_percent: 90
          - type: custom-metric
            prometheus_query: up{cluster="primary"}
            min_value: 1
        annotations:
          cluster-role: primary
          data-replication: enabled
          failover-target: standby-us-east-2
      
      standby-us-east-2:
        name: fintech-standby-us-east-2
        endpoint: https://eks-standby-us-east-2.fintech.internal:6443
        region: us-east-2
        priority: 2
        health_checks:
          - type: api-server
            path: /healthz
            expected_status: 200
          - type: etcd
            endpoint: https://etcd-standby-us-east-2.fintech.internal:2379/health
            expected_status: 200
          - type: node-resources
            min_ready_nodes: 2
            max_unavailable_percent: 20
          - type: pod-readiness
            namespace: critical
            min_ready_percent: 90
        annotations:
          cluster-role: standby
          data-replication: syncing
          failover-target: standby-us-west-2
      
      standby-us-west-2:
        name: fintech-standby-us-west-2
        endpoint: https://eks-standby-us-west-2.fintech.internal:6443
        region: us-west-2
        priority: 3
        health_checks:
          - type: api-server
            path: /healthz
            expected_status: 200
          - type: etcd
            endpoint: https://etcd-standby-us-west-2.fintech.internal:2379/health
            expected_status: 200
          - type: node-resources
            min_ready_nodes: 1
            max_unavailable_percent: 30
          - type: pod-readiness
            namespace: critical
            min_ready_percent: 80
        annotations:
          cluster-role: standby
          data-replication: async
          failover-target: standby-eu-west-1
      
      standby-eu-west-1:
        name: fintech-standby-eu-west-1
        endpoint: https://eks-standby-eu-west-1.fintech.internal:6443
        region: eu-west-1
        priority: 4
        health_checks:
          - type: api-server
            path: /healthz
            expected_status: 200
          - type: etcd
            endpoint: https://etcd-standby-eu-west-1.fintech.internal:2379/health
            expected_status: 200
        annotations:
          cluster-role: disaster-recovery
          data-replication: async
          failover-target: none
      
      standby-ap-southeast-1:
        name: fintech-standby-ap-southeast-1
        endpoint: https://eks-standby-ap-southeast-1.fintech.internal:6443
        region: ap-southeast-1
        priority: 5
        health_checks:
          - type: api-server
            path: /healthz
            expected_status: 200
          - type: etcd
            endpoint: https://etcd-standby-ap-southeast-1.fintech.internal:2379/health
            expected_status: 200
        annotations:
          cluster-role: disaster-recovery
          data-replication: async
          failover-target: none
    
    # Reglas de failover automático
    failover_rules:
      - name: primary-api-failure
        condition:
          cluster: primary
          check_type: api-server
          consecutive_failures: 3
        action:
          type: failover
          target: standby-us-east-2
          dns_update: true
          notification_channels:
            - slack-alerts
            - pagerduty-critical
        rollback_enabled: true
        rollback_delay: 300s
      
      - name: primary-etcd-failure
        condition:
          cluster: primary
          check_type: etcd
          consecutive_failures: 2
        action:
          type: failover
          target: standby-us-east-2
          dns_update: true
          notification_channels:
            - slack-alerts
            - pagerduty-critical
        rollback_enabled: true
        rollback_delay: 300s
      
      - name: standby-resources-degraded
        condition:
          cluster_regex: "standby-.*"
          check_type: node-resources
          threshold_exceeded: true
          max_unavailable_percent: 50
        action:
          type: alert
          severity: warning
          notification_channels:
            - slack-warnings
      
      - name: multi-cluster-failure
        condition:
          min_clusters_unhealthy: 2
          check_type: api-server
        action:
          type: escalate
          severity: critical
          notification_channels:
            - slack-alerts
            - pagerduty-critical
            - email-infra-oncall

    # Configuración de Prometheus para métricas
    prometheus:
      enabled: true
      scrape_interval: 30s
      metrics_path: /metrics
      labels:
        component: health-check-listener
        environment: production
      recording_rules:
        - name: cluster_health
          expr: up{job="kubernetes-apiserver"} == 1
        - name: cluster_failover_needed
          expr: sum(failover_triggered) by (cluster) > 0
        - name: health_check_latency
          expr: histogram_quantile(0.99, rate(health_check_duration_seconds_bucket[5m]))

    # Configuración de Alertmanager
    alertmanager:
      enabled: true
      config:
        route:
          group_by: ['cluster', 'alertname']
          group_wait: 10s
          group_interval: 10s
          repeat_interval: 12h
          receiver: default
          routes:
            - match:
                severity: critical
              receiver: critical-alerts
              continue: true
            - match:
                severity: warning
              receiver: warning-alerts
        receivers:
          - name: default
            slack_configs:
              - channel: '#fintech-alerts'
                send_resolved: true
          - name: critical-alerts
            slack_configs:
              - channel: '#fintech-critical'
                send_resolved: true
            pagerduty_configs:
              - service_key: PAGERDUTY_KEY
                severity: critical
          - name: warning-alerts
            slack_configs:
              - channel: '#fintech-warnings'
                send_resolved: true

    # Configuración de logging
    logging:
      level: info
      format: json
      output: stdout
      fields:
        service: health-check-listener
        version: "1.0.0"
        environment: production

    # Configuración de seguridad
    security:
      tls_enabled: true
      tls_cert_path: /etc/health-check/tls/server.crt
      tls_key_path: /etc/health-check/tls/server.key
      api_auth_enabled: true
      api_auth_method: token
      rate_limit:
        enabled: true
        requests_per_minute: 100

    # Configuración de métricas personalizadas para Grafana
    grafana_dashboards:
      - name: cluster-health-overview
        panels:
          - title: Cluster Availability
            type: stat
            targets:
              - expr: up{job="kubernetes-apiserver"}
                legendFormat: "{{cluster}}"
          - title: Health Check Latency
            type: graph
            targets:
              - expr: rate(health_check_duration_seconds_sum[5m]) / rate(health_check_duration_seconds_count[5m])
                legendFormat: "{{cluster}}"
          - title: Failover Events
            type: table
            targets:
              - expr: failover_triggered{job="health-check-listener"}
                legendFormat: "{{cluster}} -> {{target}}"
          - title: Node Readiness by Cluster
            type: gauge
            targets:
              - expr: kube_node_status_ready{job="kube-state-metrics"}
                legendFormat: "{{cluster}} - {{node}}"

    # Configuración de backup de estado
    state_backup:
      enabled: true
      interval: 5m
      storage:
        type: s3
        bucket: fintech-health-check-state
        prefix: backups/
      retention:
        days: 30

---
apiVersion: v1
kind: Service
metadata:
  name: health-check-listener
  namespace: monitoring
  labels:
    app: health-check-listener
    component: observability
spec:
  type: ClusterIP
  ports:
    - name: http
      port: 8080
      targetPort: http
      protocol: TCP
    - name: grpc
      port: 9090
      targetPort: grpc
      protocol: TCP
  selector:
    app: health-check-listener

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: health-check-listener
  namespace: monitoring
  labels:
    app: health-check-listener
    component: observability
spec:
  replicas: 2
  selector:
    matchLabels:
      app: health-check-listener
  template:
    metadata:
      labels:
        app: health-check-listener
        component: observability
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "8080"
        prometheus.io/path: /metrics
    spec:
      serviceAccountName: health-check-listener
      securityContext:
        runAsNonRoot: true
        runAsUser: 1000
        fsGroup: 2000
      containers:
        - name: listener
          image: fintech/health-check-listener:1.0.0
          imagePullPolicy: Always
          ports:
            - name: http
              containerPort: 8080
              protocol: TCP
            - name: grpc
              containerPort: 9090
              protocol: TCP
          env:
            - name: CONFIG_PATH
              value: /config/health-check-config.yaml
            - name: LOG_LEVEL
              value: "info"
            - name: PROMETHEUS_ENDPOINT
              value: http://prometheus.monitoring.svc:9090
            - name: ALERTMANAGER_ENDPOINT
              value: http://alertmanager.monitoring.svc:9093
          resources:
            requests:
              memory: "256Mi"
              cpu: "100m"
            limits:
              memory: "512Mi"
              cpu: "500m"
          volumeMounts:
            - name: config
              mountPath: /config
              readOnly: true
            - name: tls
              mountPath: /etc/health-check/tls
              readOnly: true
          livenessProbe:
            httpGet:
              path: /healthz
              port: http
            initialDelaySeconds: 30
            periodSeconds: 10
          readinessProbe:
            httpGet:
              path: /ready
              port: http
            initialDelaySeconds: 5
            periodSeconds: 5
      volumes:
        - name: config
          configMap:
            name: health-check-listener-config
        - name: tls
          secret:
            secretName: health-check-listener-tls

---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: health-check-listener
  namespace: monitoring
  annotations:
    description: >
      ServiceAccount para health check listener que monitorea
      la salud de clusters y ejecuta failover automático

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: health-check-listener
  annotations:
    description: >
      Permisos para que health-check-listener pueda leer
      el estado de los clusters y ejecutar failovers
rules:
  - apiGroups: [""]
    resources: ["nodes", "pods", "services", "endpoints"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["configmaps"]
    verbs: ["get", "list", "watch", "update", "patch"]
  - apiGroups: ["argoproj.io"]
    resources: ["applications"]
    verbs: ["get", "list", "watch", "update", "patch"]
  - apiGroups: ["coordination.k8s.io"]
    resources: ["leases"]
    verbs: ["get", "create", "update"]
  - apiGroups: ["custom.fintech.io"]
    resources: ["failovers"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: health-check-listener
subjects:
  - kind: ServiceAccount
    name: health-check-listener
    namespace: monitoring
roleRef:
  kind: ClusterRole
  name: health-check-listener
  apiGroup: rbac.authorization.k8s.io

```
