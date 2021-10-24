provider "aws" {
  region  = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.ec2_s3_rds_security_group.id ]
  key_name = var.key_name
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
user_data = <<-EOF
    #!/bin/bash
    aws s3api get-object --bucket ${var.bucket_name} --key ${var.dynamodb_file_key} ${var.dynamodb_file_key}
    aws s3api get-object --bucket ${var.bucket_name} --key ${var.rds_file_key} ${var.rds_file_key}
  EOF
}