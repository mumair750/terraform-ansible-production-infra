terraform {
  backend "s3" {
    bucket         = "tf-state-production-infra-umair-arshad"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}