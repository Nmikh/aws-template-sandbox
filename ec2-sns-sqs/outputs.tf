output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "sns_arn" {
  description = "sns_arn"
  value       = aws_sns_topic.sns_topic.arn
}

output "sqs_url" {
  description = "sqs_url"
  value       = aws_sqs_queue.sqs_queue.id
}