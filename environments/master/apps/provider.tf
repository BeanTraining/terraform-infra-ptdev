
terraform {
}

provider "aws" {
  region  = var.secondary_aws_region
  version = "3.12.0"

  assume_role {
    role_arn = "arn:aws:iam::${var.secondary_aws_account_ids.apps}:role/TerraformBaselineRole"
  }
}
