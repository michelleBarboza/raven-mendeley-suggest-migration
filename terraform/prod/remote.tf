#---------------------------------
# Backend config for tfstate 
#---------------------------------
terraform {
  required_version = ">= 0.13"
  backend "s3" {
    bucket = "elsevier-tio-spf-prod-711231291569"
    key    = "tfstate/raven-prod-refactor/raven-prod/transaction.tfstate"
    region = "us-east-1"
  }
}
