resource "helm_release" "postgres" {
  name       = "postgres"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace  = var.namespace

  set {
    name  = "global.postgresql.auth.postgresPassword"
    value = var.postgres_config.password
  }
}
