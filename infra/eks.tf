module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21"

  name               = var.eks_cluster_name
  kubernetes_version = var.k8s_version

  # Optional
  endpoint_public_access  = true
  endpoint_private_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # Essential Kubernetes Addons for networking and DNS
  addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]

      min_size     = 2
      max_size     = 2
      desired_size = 2

      iam_role_additional_policies = {
        AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
        AmazonEKS_CNI_Policy         = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
