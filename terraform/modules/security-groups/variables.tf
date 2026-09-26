variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block for internal access rules"
  type        = string
  default     = "10.0.0.0/16"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into bastion host"
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 3000
}

variable "db_port" {
  description = "Database port (3306 MySQL, 5432 Postgres)"
  type        = number
  default     = 5432
}
