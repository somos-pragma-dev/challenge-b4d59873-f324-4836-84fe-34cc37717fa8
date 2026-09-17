# Diseño de control plane multi-cluster en Kubernetes con GitOps y DR

Eres un arquitecto de soluciones para una empresa fintech que gestiona 12 clusters Kubernetes distribuidos en 4 regiones de AWS. Debes diseñar un control plane que utilice ArgoCD para GitOps, Crossplane para provisionar infraestructura, y una lógica custom de failover. El objetivo es garantizar alta disponibilidad y recuperación ante desastres. Debes considerar la topología de replicación de estado, la elección de herramientas de GitOps, el modelo de RBAC federado, la gestión de secrets, y la coreografía del disaster recovery.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | control plane multi-cluster kubernetes con GitOps y disaster recovery cross-region |
| **Nivel** | master-l2 |
| **Tipo** | theoretical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Node.js 18+, npm, VS Code o similar.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Ejecuta `npm install && npm run build` (o `npm start`). Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Topología de replicación de estado

**Objetivo:** Definir cómo se replicará el estado entre clusters para mantener consistencia y alta disponibilidad.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identifica los componentes críticos que requieren replicación de estado.
- Evalúa diferentes topologías de replicación (por ejemplo, líder-seguidor, multi-maestro) y elige la más adecuada.
- Justifica tu elección considerando factores como latencia, consistencia y complejidad de implementación.

**Entregable:** Documento que describe la topología de replicación de estado elegida y su justificación.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la latencia entre regiones y su impacto en la consistencia de datos.
- Evalúa la complejidad de implementar y mantener cada topología.

</details>

### Fase 2: Elección de herramientas de GitOps

**Objetivo:** Justificar la elección de ArgoCD sobre Flux y Rancher Fleet para el flujo de trabajo de GitOps.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Compara las características y ventajas de ArgoCD, Flux y Rancher Fleet.
- Evalúa cada herramienta en términos de facilidad de uso, integración con Kubernetes, y soporte para políticas de sincronización.
- Elige la herramienta que mejor se ajuste a los requisitos del proyecto y justifica tu elección.

**Entregable:** Documento que compara las herramientas de GitOps y justifica la elección de ArgoCD.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la madurez y la comunidad de soporte de cada herramienta.
- Evalúa la facilidad de configuración y mantenimiento.

</details>

### Fase 3: Modelo de RBAC federado

**Objetivo:** Diseñar un modelo de RBAC que permita la gestión centralizada de permisos en un entorno multi-cluster.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identifica los roles y permisos necesarios para gestionar los clusters.
- Diseña un modelo de RBAC que permita la asignación de permisos de manera centralizada.
- Justifica las decisiones tomadas en términos de seguridad y facilidad de gestión.

**Entregable:** Documento que describe el modelo de RBAC federado y su justificación.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la granularidad de los permisos y su impacto en la seguridad.
- Evalúa la facilidad de gestión y mantenimiento del modelo de RBAC.

</details>

### Fase 4: Estrategia de secrets con Vault + external-secrets

**Objetivo:** Diseñar una estrategia para la gestión de secrets en un entorno multi-cluster utilizando Vault y external-secrets.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identifica los tipos de secrets que se deben gestionar.
- Diseña una estrategia que integre Vault y external-secrets para la gestión de secrets.
- Justifica las decisiones tomadas en términos de seguridad y facilidad de uso.

**Entregable:** Documento que describe la estrategia de gestión de secrets y su justificación.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la seguridad y la facilidad de uso de la estrategia.
- Evalúa la integración con otros componentes del sistema.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es un control plane en un entorno multi-cluster de Kubernetes?
- **paraQueSirve**: ¿Para qué sirve utilizar ArgoCD en un flujo de trabajo de GitOps?
- **comoSeUsa**: ¿Cómo se implementa un modelo de RBAC federado en un entorno multi-cluster?
- **erroresComunes**: ¿Cuáles son los errores comunes al diseñar una estrategia de gestión de secrets con Vault y external-secrets?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño de una coreografía de disaster recovery en un entorno multi-cluster?

## Criterios de Evaluacion

- Definición clara de la topología de replicación de estado y su justificación.
- Comparativa detallada de herramientas de GitOps y justificación de la elección de ArgoCD.
- Diseño de un modelo de RBAC federado y su justificación.
- Estrategia de gestión de secrets con Vault y external-secrets y su justificación.
- Diseño de una coreografía de disaster recovery y justificación de las decisiones tomadas.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
el comando de build o arranque canonico del stack elegido
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
