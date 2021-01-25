data "aws_elb" "ingress" {
  name = data.terraform_remote_state.eks_raven_nonprod.outputs.nginx_ingress_lb_name
}

// dev endpoint route
resource "aws_route53_record" "dev-transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_nonprod.outputs.np_elsst_com_zone_id
  name            = "dev-${local.app_name}"
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}

// staging endpoint route
resource "aws_route53_record" "staging-transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_nonprod.outputs.np_elsst_com_zone_id
  name            = "staging-${local.app_name}"
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}

// pie endpoint route
resource "aws_route53_record" "pie-transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_nonprod.outputs.np_elsst_com_zone_id
  name            = "pie-transaction"
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}

// pie notification endpoint route
resource "aws_route53_record" "pie-notification-transaction" {
  zone_id         = data.terraform_remote_state.eks_raven_nonprod.outputs.np_elsst_com_zone_id
  name            = "pie-notification-transaction"
  type            = "A"
  allow_overwrite = true
  alias {
    name = data.aws_elb.ingress.dns_name
    zone_id = data.aws_elb.ingress.zone_id
    evaluate_target_health = false
  }
}