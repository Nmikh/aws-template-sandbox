resource "aws_dynamodb_table" "fruits-dynamodb-table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "product_id"

  attribute {
    name = "product_id"
    type = "N"
  }
}

resource "aws_db_instance" "postges" {
  allocated_storage    = var.rds_allocated_storage
  storage_type         = var.rds_storage_type
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  name                 = var.rds_name
  username             = var.rds_username
  password             = var.rds_password
  skip_final_snapshot  = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.ec2_s3_rds_security_group.id]
}