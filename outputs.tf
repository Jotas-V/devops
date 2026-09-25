output "cluster_name" {
  description = "Nome do cluster Kubernetes provisionado"
  value       = kind_cluster.devops.name
}

output "client_key" {
  description = "Client key do kubeconfig gerado"
  value       = kind_cluster.devops.client_key
  sensitive   = true
}
