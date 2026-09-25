terraform {
  required_version = ">= 1.0.0"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.11.0"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "devops" {
  name           = "devops"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
  }
}

output "cluster_endpoint" {
  value = kind_cluster.devops.endpoint
}

output "kubeconfig" {
  value     = kind_cluster.devops.kubeconfig
  sensitive = true
}
