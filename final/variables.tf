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

variable "public_cidr_block_1" {
  description = "public cidr_block 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_cidr_block_2" {
  description = "public cidr_block 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_cidr_block_1" {
  description = "private cidr_block 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_cidr_block_2" {
  description = "private cidr_block 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "public_subnet_availability_zone_1" {
  description = "private subnet availability_zone 1"
  type        = string
  default     = "us-west-2a"
}

variable "public_subnet_availability_zone_2" {
  description = "private subnet availability_zone 2"
  type        = string
  default     = "us-west-2b"
}

variable "private_subnet_availability_zone_1" {
  description = "private subnet availability_zone 1"
  type        = string
  default     = "us-west-2c"
}

variable "private_subnet_availability_zone_2" {
  description = "private subnet availability_zone 2"
  type        = string
  default     = "us-west-2d"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "edu-lohika-training-aws-dynamodb"
}

variable "sqs_queue" {
  description = "sqs queue"
  type        = string
  default     = "edu-lohika-training-aws-sqs-queue"
}

variable "sns_topic" {
  description = "sns topic"
  type        = string
  default     = "edu-lohika-training-aws-sns-topic"
}

variable "sns_email_subscription" {
  description = "sns email subscription"
  type        = string
}

variable "rds_allocated_storage" {
  description = "RDS allocated storage"
  type        = number
  default     = 20
}

variable "rds_storage_type" {
  description = "RDS storage type"
  type        = string
  default     = "gp2"
}

variable "rds_engine" {
  description = "RDS engine"
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "RDS engine version"
  type        = string
  default     = "12.8"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "rds_name" {
  description = "RDS name"
  type        = string
  default     = "EduLohikaTrainingAwsRds"
}

variable "rds_username" {
  description = "RDS username"
  type        = string
  default     = "rootuser"
}

variable "rds_password" {
  description = "RDS password"
  type        = string
  default     = "rootuser"
}

variable "bucket_name" {
  description = "bucket name"
  type        = string
  default     = "nmikh-jars"
}

variable "persist_jar" {
  description = "persist_jar name"
  type        = string
  default     = "persist3-0.0.1-SNAPSHOT.jar"
}

variable "calc_jar" {
  description = "calc_jar name"
  type        = string
  default     = "calc-0.0.2-SNAPSHOT.jar"
}