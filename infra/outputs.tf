output "cluster_name" {
  value       = module.eks.cluster_name
  description = "The name of the managed EKS cluster."

}
output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "The endpoint URL for the Kubernetes API server."
}
