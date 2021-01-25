#=====================================================================================================#
#  Terraform Remote State common file for eks nonprod
#=====================================================================================================#
data "terraform_remote_state" "eks_raven_nonprod" {
  backend = "s3"

  config = {
    bucket = "elsevier-tio-spf-non-prod-869499070373"
    key    = "tfstate/raven-refactor/raven-pie/eks.tfstate"
    region = "us-east-1"
  }
}

data "aws_caller_identity" "current" {}

locals {
  app_name = "transaction"
}