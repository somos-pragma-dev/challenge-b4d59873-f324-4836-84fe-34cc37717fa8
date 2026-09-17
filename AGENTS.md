# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Diseño de control plane multi-cluster en Kubernetes con GitOps y DR**.

| | |
|---|---|
| Tema | control plane multi-cluster kubernetes con GitOps y disaster recovery cross-region |
| Nivel | master-l2 |
| Chapter | Generico |
| Especialidad | Inferido del contexto |
| Stack | YAML / Kubernetes 1.28 + ArgoCD 2.10 + Crossplane 1.14 + Vault 1.15 + external-secrets 0.9 |
| Patron arquitectonico | control plane multi-cluster con GitOps, disaster recovery cross-region y RBAC federado |
| Tiempo estimado | 8 horas |

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `el comando de build o arranque canonico del stack elegido` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `el comando de build o arranque canonico del stack elegido` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Topología de replicación de estado**: Documento que describe la topología de replicación de estado elegida y su justificación.
- **Fase 2 — Elección de herramientas de GitOps**: Documento que compara las herramientas de GitOps y justifica la elección de ArgoCD.
- **Fase 3 — Modelo de RBAC federado**: Documento que describe el modelo de RBAC federado y su justificación.
- **Fase 4 — Estrategia de secrets con Vault + external-secrets**: Documento que describe la estrategia de gestión de secrets y su justificación.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Lo que falta y tenes que completar

### Archivos corruptos (2) — arreglá esto primero

El contenido de estos archivos no corresponde a su extension. Regeneralos completos:

- [ ] `package.json` — El contenido no corresponde a un archivo json. Hay que regenerarlo completo.
- [ ] `aws/iam-policy.json` — El contenido no corresponde a un archivo json. Hay que regenerarlo completo.

### 1. Boilerplate del stack (2)

Sin esto el proyecto no compila ni arranca. **Es tu trabajo crearlo**, y no toca nada de lo pedagogico: es andamiaje del stack.

- [ ] **Punto de entrada del stack elegido** — Sin un punto de entrada reconocible, el runtime no tiene por donde arrancar la aplicacion.
- [ ] **Capa de interfaz (controller/handler)** — Sin una capa de interfaz explicita, no hay forma de invocar la logica de negocio desde afuera del proceso.

### Presentes (24)

- `package.json`
- `manifests/argocd/application.yaml`
- `clusters/primary-cluster.yaml`
- `clusters/standby-clusters.yaml`
- `manifests/argocd/argocd-cm.yaml`
- `manifests/crossplane/providers.yaml`
- `manifests/crossplane/compositions.yaml`
- `manifests/vault/config.hcl`
- `manifests/external-secrets/secret-store.yaml`
- `manifests/rbac/cluster-role.yaml`
- `manifests/rbac/role-binding.yaml`
- `manifests/disaster-recovery/failover-controller.yaml`
- `manifests/disaster-recovery/anti-split-brain.yaml`
- `manifests/apps/nginx-deployment.yaml`
- `tests/argocd-sync-test.yaml`
- `tests/crossplane-provisioning-test.yaml`
- `tests/vault-secrets-test.yaml`
- `docs/topologia-replicacion-estado.md`
- `docs/comparativa-gitops-herramientas.md`
- `docs/modelo-rbac-federado.md`
- `docs/estrategia-secrets.md`
- `docs/coreografia-disaster-recovery.md`
- `aws/iam-policy.json`
- `aws/health-check-listener.yaml`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `clusters/`
- `manifests/`
- `manifests/argocd/`
- `manifests/crossplane/`
- `manifests/vault/`
- `manifests/external-secrets/`
- `manifests/rbac/`
- `manifests/disaster-recovery/`
- `manifests/apps/`
- `tests/`
- `docs/`

## Verificacion

```bash
el comando de build o arranque canonico del stack elegido
```

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **control plane multi-cluster con GitOps, disaster recovery cross-region y RBAC federado**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Brecha que el reto ataca: Arquitectura master-l2 de un control plane que gestiona 12 clusters Kubernetes distribuidos en 4 regiones AWS. Usa ArgoCD para GitOps con sync policies por entorno, Crossplane para provisionar infraestructura declarativa (RDS, S3, IAM roles) desde el repo de Git, y una lógica custom de failover que promueve un cluster standby cuando el primary de una región falla su health check por 3 minutos consecutivos. El developer master-l2 debe diseñar la topología de replicación de estado entre clusters, justificar la elección de ArgoCD vs Flux vs Rancher Fleet, el modelo de RBAC federado, la estrategia de secrets con Vault + external-secrets, y la coreografía del disaster recovery incluyendo cómo evita el split-brain durante failovers.

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
