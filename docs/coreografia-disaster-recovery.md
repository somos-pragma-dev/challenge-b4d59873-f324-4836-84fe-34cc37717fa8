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