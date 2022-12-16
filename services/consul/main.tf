resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  namespace  = var.namespace
  values = [
    file("${path.module}/config.yml")
  ]
}

// load intentions
resource "kubectl_manifest" "consul-intentions" {
  yaml_body = file("${path.module}/intentions.yml")
  depends_on = [
    helm_release.consul
  ]
}
