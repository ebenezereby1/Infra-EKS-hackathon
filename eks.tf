module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.8"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # 🔥 ADD / UPDATE THESE
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_endpoint_public_access_cidrs = [
    "0.0.0.0/0"
  ]

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.micro"]
      desired_size   = 1
      min_size       = 1
      max_size       = 2
    }
  }
}
