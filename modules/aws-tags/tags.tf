# See required tags in Documentation
# Commented tags defined below are mandatory but moved to respective modules mostly because interpolation is required

locals {

  # COMMONS
  common = {
    # "Name" tag should be used directly on resources module
    "aws.region"          = data.aws_region.bean.name
    "bean.application"     = lower(var.application)
    "bean.cost_center"     = lower(var.cost_center)
    "bean.environment"     = lower(var.environment)
    "bean.owner"           = lower(var.owner)
    "bean.tagging_version" = "v2"
  }


  common_core_mandatory = merge(
    # directory services, cloudfront, dx, kms, route53, secret manager, vpc, vpn, waf & shield
    local.common,
    {
      # core.surname is used to build proper value for Name tag for CF resources
      # it is based on mandatory tags + account alias. Having that here gives us opportunity
      # to change globally naming convention of Name tag for such resources.
      "core.surname"        = "${data.aws_region.bean.name}-${data.aws_iam_account_alias.current.account_alias}"
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "bean.site"            = lower(var.site)
    }
  )

  common_core_optional = {
    "bean.application_role"     = lower(var.application_role)
    "bean.business_criticality" = lower(var.business_criticality)
    "bean.saving_plan"          = lower(var.saving_plan)
  }

  # /COMMONS


  # Please keep tags in alphabetical order:

  acm_mandatory = local.common_core_mandatory
  acm_optional  = local.common_core_optional
  acm = merge(
    local.acm_mandatory,
    local.acm_optional,
  )

  asg = merge(
    local.common,
    {
      #Name = var.name  #This has been moved to modules/aws-asg
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "Patch Group"         = lower(var.application)
    },
  )

  asm = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
    },
  )

  dx_mandatory = local.common_core_mandatory
  dx_optional  = local.common_core_optional
  dx = merge(
    local.dx_mandatory,
    local.dx_optional,
  )

  dynamodb = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "bean.site"            = lower(var.site)
    },
  )

  ec2 = merge(
    local.common,
    {
      #Name = var.name  #This has been moved to modules/aws-ec2-instance module
      #aws.az = var.az  #This has been moved to modules/aws-ec2-instance module
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "Patch Group"         = lower(var.application)
    },
  )

  elb = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
    },
  )

  eks = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "bean.site"            = lower(var.site)
      "Patch Group"         = lower(var.application)
    },
  )

  elastic_beanstalk = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "Patch Group"         = lower(var.application)
    },
  )

  endpoint_mandatory = local.common_core_mandatory
  endpoint_optional  = local.common_core_optional
  endpoint = merge(
    local.endpoint_mandatory,
    local.endpoint_optional
  )

  iam_mandatory = {
    "bean.application"     = lower(var.application)
    "bean.owner"           = lower(var.owner)
    "bean.tagging_version" = "v2"
  }
  iam_optional = {
    "bean.bounded_context" = lower(var.bounded_context)
  }
  iam = merge(
    local.iam_mandatory,
    local.iam_optional,
  )

  igw_mandatory = local.common_core_mandatory
  igw_optional  = local.common_core_optional
  igw = merge(
    local.igw_mandatory,
    local.igw_optional,
  )

  kinesis = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "Patch Group"         = lower(var.application)
    },
  )

  kms = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
    },
  )

  lambda = local.common

  rds = merge(
    local.common,
    {
      #"Name" = var.name #This has been moved to modules/aws-rds-* module
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
    },
  )

  rt_mandatory = local.common_core_mandatory
  rt_optional  = local.common_core_optional
  rt = merge(
    local.rt_mandatory,
    local.rt_optional,
  )

  s3 = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
      "bean.site"            = lower(var.site)
    },
  )

  sqs = merge(
    local.common,
    {
      "bean.bounded_context" = lower(var.bounded_context)
      "bean.data_class"      = lower(var.data_class)
    },
  )

  ssm_maintenance_window = local.common

  tgw_mandatory = local.common_core_mandatory
  tgw_optional  = local.common_core_optional
  tgw = merge(
    local.tgw_mandatory,
    local.tgw_optional,
  )

  tgw_attachment_mandatory = local.common_core_mandatory
  tgw_attachment_optional  = local.common_core_optional
  tgw_attachment = merge(
    local.tgw_attachment_mandatory,
    local.tgw_attachment_optional,
  )

  vpc_mandatory = merge(
    local.common_core_mandatory,
    {
      "bean.data_class" = lower(var.data_class)
    }
  )
  vpc_optional = local.common_core_optional
  vpc = merge(
    local.vpc_mandatory,
    local.vpc_optional,
  )

  subnet_mandatory = local.common_core_mandatory
  subnet_optional  = local.common_core_optional
  subnet = merge(
    local.subnet_mandatory,
    local.subnet_optional,
  )

  vpn_mandatory = local.common_core_mandatory
  vpn_optional  = local.common_core_optional
  vpn = merge(
    local.vpn_mandatory,
    local.vpn_optional,
  )
}
