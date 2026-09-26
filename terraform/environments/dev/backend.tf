terraform {
  backend "s3" {
    bucket       = "tf-state-production-infra-umair-arshad"
    key          = "production/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
