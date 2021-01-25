#--------------------------------------------------------------
# Policy to give access to write logs
#--------------------------------------------------------------
data "aws_iam_policy_document" "raven_log_policy" {
  statement {
    actions = [
      "logs:*",
      "sns:*",
      "cloudwatch:*",
      "firehose:PutRecord",
      "firehose:PutRecordBatch"
    ]
    resources = [
      "*"
    ]
  }
}

#--------------------------------------------------------------
# Policy to give access to s3
#--------------------------------------------------------------
data "aws_iam_policy_document" "raven_s3_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject"
    ]
    resources = [
      "*"
    ]
  }
}

#--------------------------------------------------------------
# Policy to give access to ses
#--------------------------------------------------------------
data "aws_iam_policy_document" "raven_ses_policy" {
  statement {
    actions = [
      "ses:CreateTemplate",
      "ses:GetTemplate",
      "ses:ListTemplates",
      "ses:UpdateTemplate",
      "ses:DeleteTemplate",
      "ses:SendEmail",
      "ses:SendRawEmail",
      "ses:SendTemplatedEmail",
      "ses:SetActiveReceiptRuleSet",
      "ses:CreateConfigurationSet",
      "ses:ListConfigurationSets",
      "ses:DescribeConfigurationSet",
      "ses:DeleteConfigurationSet"
    ]

    resources = [
      "*"
    ]
  }
}

#--------------------------------------------------------------
# Policy to give access to read secrets
#--------------------------------------------------------------
data "aws_iam_policy_document" "raven_parameterstore_policy" {
  statement {
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParameters"
    ]

    resources = [
      "*"
    ]
  }
}
