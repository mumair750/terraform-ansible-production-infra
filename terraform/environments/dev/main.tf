# ============================================
# VPC Module
# ============================================
module "vpc" {
  source = "../../modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.4.0/24"]
  enable_nat_gateway   = true
}

# ============================================
# Outputs
# ============================================

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

# ======================================
# SG Module
# ======================================

module "security_groups" {
  source = "../../modules/security-groups"

  project_name     = var.project_name
  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = "39.38.99.156/32"
  app_port         = 3000
  db_port          = 5432
}

# ============================================
# Outputs (SG IDs)
# ============================================
output "alb_sg_id" {
  value = module.security_groups.alb_sg_id
}

output "app_sg_id" {
  value = module.security_groups.app_sg_id
}

output "bastion_sg_id" {
  value = module.security_groups.bastion_sg_id
}

output "monitoring_sg_id" {
  value = module.security_groups.monitoring_sg_id
}

output "rds_sg_id" {
  value = module.security_groups.rds_sg_id
}

# ============================================
# EC2 Module
# ============================================
module "ec2" {
  source = "../../modules/ec2"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  bastion_sg_id      = module.security_groups.bastion_sg_id
  app_sg_id          = module.security_groups.app_sg_id
  monitoring_sg_id   = module.security_groups.monitoring_sg_id
  instance_type      = var.instance_type
  key_name           = "prod-infra-key"
  app_instance_count = 2
}

# ============================================
# EC2 Outputs
# ============================================
output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}

output "app_private_ips" {
  value = module.ec2.app_private_ips
}

output "monitoring_private_ip" {
  value = module.ec2.monitoring_private_ip
}

output "ssh_key_name" {
  value = module.ec2.key_name
}

# ============================================
# ALB Module
# ============================================
module "alb" {
  source = "../../modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  app_instance_ids  = module.ec2.app_instance_ids
  app_port          = 3000
  health_check_path = "/"
}

# ============================================
# ALB Outputs
# ============================================
output "alb_dns_name" {
  description = "Access your app at this URL"
  value       = "http://${module.alb.alb_dns_name}"
}

output "alb_arn" {
  value = module.alb.alb_arn
}
