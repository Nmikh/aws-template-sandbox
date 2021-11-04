variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "ec2_ami_id" {
  description = "AMI identifier for the EC2 instance"
  type        = string
  default     = "ami-00f9f4069d04c0c6e"
}

variable "nat_ami_id" {
  description = "AMI identifier for the NAT instance"
  type        = string
  default     = "ami-0032ea5ae08aa27a2"
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

variable "vpc_cidr_block" {
  description = "VPC cidr_block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr_block" {
  description = "public cidr_block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_cidr_block" {
  description = "private cidr_block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_availability_zone" {
  description = "private subnet availability_zone"
  type        = string
  default     = "us-west-2a"
}

variable "private_subnet_availability_zone" {
  description = "private subnet availability_zone"
  type        = string
  default     = "us-west-2b"
}