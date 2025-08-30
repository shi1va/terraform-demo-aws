module "eks" {

  #import the EKS module from the Terraform Registry  
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  #cluster info control plane
  name               = local.name
  kubernetes_version = "1.33"

  addons = {
    coredns                = {
        most_recent = true
    }
    eks-pod-identity-agent = {
      most_recent = true
    }
    kube-proxy             = {
        most_recent = true
    }
    vpc-cni                = {
        most_recent = true
    }
  }

  endpoint_public_access = true

   #vpc and subnets
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets


  #EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"

      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }


  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
