#---------------------------------
# Backend config for tfstate 
#---------------------------------
terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "elsevier-tio-spf-non-prod-869499070373"
    key    = "tfstate/raven-refactor/raven-pie/transaction.tfstate"
    region = "us-east-1"
  }
}
