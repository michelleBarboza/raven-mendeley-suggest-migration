#=====================================================================================================#
#  Terraform Remote State common file for eks nonprod
#=====================================================================================================#
data "terraform_remote_state" "eks_raven_prod" {
  backend = "s3"

  config = {
    bucket = "elsevier-tio-spf-prod-711231291569"
    key    = "tfstate/raven-prod-refactor/raven-prod/eks/eks.tfstate"
    region = "us-east-1"
  }
}

data "aws_caller_identity" "current" {}

locals {
  app_name = "transaction"
}

