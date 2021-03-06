output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "rds_public_ip" {
  description = "RDS instance hostname"
  value       = aws_db_instance.postges.endpoint
  sensitive   = true
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.postges.address
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.postges.port
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.postges.username
  sensitive   = true
}