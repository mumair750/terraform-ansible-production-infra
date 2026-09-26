provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "terraform-ansible-production-infra"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "DevOps-Team"
    }
  }
}