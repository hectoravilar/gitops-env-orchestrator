variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}
variable "gitops_vpc" {
  description = "The name of the GitOps VPC."
  type        = string
  default     = "gitops-vpc"

}
variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}
variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "gitops-eks-cluster"
}
variable "k8s_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.33"
}

