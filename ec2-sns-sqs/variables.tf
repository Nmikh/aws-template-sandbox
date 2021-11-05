variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI identifier for the EC2 instance"
  type        = string
  default     = "ami-0c2d06d50ce30b442"
}

variable "instance_type" {
  description = "WebServer EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key"
  type        = string
  default     = "ec2-test-us-west-2"
}

variable "sns_email_subscription" {
  description = "sns email subscription"
  type        = string
}
