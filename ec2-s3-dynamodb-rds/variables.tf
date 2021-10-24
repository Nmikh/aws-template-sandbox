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

variable "bucket_name" {
  description = "Bucket name"
  type        = string
  default     = "nmikh-bucket"
}

variable "dynamodb_file_key" {
  description = "DynamoDB File key"
  type        = string
  default     = "dynamodb-script.sh"
}

variable "rds_file_key" {
  description = "RDS File key"
  type        = string
  default     = "rds-script.sql"
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
  default     = "mydb"
}

variable "rds_username" {
  description = "RDS username"
  type        = string
  default     = "foo"
}

variable "rds_password" {
  description = "RDS password"
  type        = string
  default     = "foobarbaz"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "FruitsTable"
}