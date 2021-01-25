data "aws_elb" "ingress" {
  name = data.terraform_remote_state.eks_raven_prod.outputs.nginx_ingress_lb_name
}

// prod endpoint route
resource "aws_route53_record" "transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_prod.outputs.api_elsst_com_zone_id
  name            = local.app_name
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "prod-transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_prod.outputs.api_elsst_com_zone_id
  name            = "prod-${local.app_name}"
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "prod-notification-transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_prod.outputs.api_elsst_com_zone_id
  name            = "prod-notification-${local.app_name}"
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}
