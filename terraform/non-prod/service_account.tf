#--------------------------------------------------------------
# transaction service account
#--------------------------------------------------------------
module "transaction_service_account" {
  source = "git@github.com:elsevier-centraltechnology/core-terraform-eks.git//eks-iam-role?ref=5.1.1"

  cluster_name                       = data.terraform_remote_state.eks_raven_nonprod.outputs.cluster_name
  role_name                          = "${local.app_name}-service-account"
  service_accounts                   = ["*/${local.app_name}-service-account"]
  policies                           = [ data.aws_iam_policy_document.raven_log_policy.json,
                                         data.aws_iam_policy_document.raven_s3_policy.json,
                                         data.aws_iam_policy_document.raven_ses_policy.json,
                                         data.aws_iam_policy_document.raven_parameterstore_policy.json
                                       ]
  cluster_certificate_authority_data = data.terraform_remote_state.eks_raven_nonprod.outputs.cluster_certificate_authority_data

  tag_product       = data.terraform_remote_state.eks_raven_nonprod.outputs.tag_product
  tag_description   = "service_account_for_${local.app_name}"
  tag_environment   = data.terraform_remote_state.eks_raven_nonprod.outputs.tag_environment
  tag_sub_product   = data.terraform_remote_state.eks_raven_nonprod.outputs.tag_product
  tag_cost_code     = data.terraform_remote_state.eks_raven_nonprod.outputs.tag_cost_code
  tag_contact       = data.terraform_remote_state.eks_raven_nonprod.outputs.tag_contact
  tag_orchestration = data.terraform_remote_state.eks_raven_nonprod.outputs.tag_orchestration
}

provider "aws" {
  region = "us-east-1"
}