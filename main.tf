terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
    }
  }
}

provider "kubernetes" {
  config_path    = var.kube_config_path
  config_context = var.kube_config_context
}

provider "helm" {
  kubernetes {
    config_path    = var.kube_config_path
    config_context = var.kube_config_context
  }
}

resource "kubernetes_namespace" "furink_namespace" {
  metadata {
	name = "furink"
  }
}

module "consul" {
  source = "./services/consul"
  namespace = "furink"
}

module "postgres" {
  source = "./services/postgres"
  postgres_config = {
    password = var.postgres_password,
  }
}
