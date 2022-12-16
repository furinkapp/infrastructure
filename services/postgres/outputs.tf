output "postgres_ip" {
  value = yamldecode(helm_release.postgres.status).podIP
  depends_on = [
	helm_release.postgres
  ]
}
