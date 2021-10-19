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

variable "file_key" {
  description = "File key"
  type        = string
  default     = "file1.txt"
}

variable "outfile_key" {
  description = "OutFile key"
  type        = string
  default     = "file2.txt"
}

