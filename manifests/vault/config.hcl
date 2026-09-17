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