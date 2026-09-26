output "bastion_id" {
  description = "Bastion instance ID"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Bastion public IP"
  value       = aws_instance.bastion.public_ip
}

output "app_instance_ids" {
  description = "Application instance IDs"
  value       = aws_instance.app[*].id
}

output "app_private_ips" {
  description = "Application private IPs"
  value       = aws_instance.app[*].private_ip
}

output "monitoring_id" {
  description = "Monitoring instance ID"
  value       = aws_instance.monitoring.id
}

output "monitoring_private_ip" {
  description = "Monitoring private IP"
  value       = aws_instance.monitoring.private_ip
}

output "key_name" {
  description = "SSH Key Pair name"
  value       = aws_key_pair.main.key_name
}
