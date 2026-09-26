variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "Security Group ID for Bastion"
  type        = string
}

variable "app_sg_id" {
  description = "Security Group ID for App servers"
  type        = string
}

variable "monitoring_sg_id" {
  description = "Security Group ID for Monitoring server"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "prod-infra-key"
}

variable "app_instance_count" {
  description = "Number of application servers"
  type        = number
  default     = 2
}
