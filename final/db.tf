resource "aws_db_instance" "postges" {
  allocated_storage      = var.rds_allocated_storage
  storage_type           = var.rds_storage_type
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  name                   = var.rds_name
  username               = var.rds_username
  password               = var.rds_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [ aws_security_group.rds_security_group.id ]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id

  tags = {
    Name = "postges"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = [ aws_subnet.custom_private_subnet_1.id, aws_subnet.custom_private_subnet_2.id ]
}


resource "aws_dynamodb_table" "edu-lohika-training-aws-dynamodb" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  hash_key       = "UserName"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "UserName"
    type = "S"
  }
}