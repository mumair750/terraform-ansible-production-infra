output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb.id
}

output "app_sg_id" {
  description = "Security Group ID for App servers"
  value       = aws_security_group.app.id
}

output "bastion_sg_id" {
  description = "Security Group ID for Bastion host"
  value       = aws_security_group.bastion.id
}

output "monitoring_sg_id" {
  description = "Security Group ID for Monitoring stack"
  value       = aws_security_group.monitoring.id
}

output "rds_sg_id" {
  description = "Security Group ID for RDS"
  value       = aws_security_group.rds.id
}
