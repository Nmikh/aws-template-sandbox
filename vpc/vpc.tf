resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "custom_vpc"
  }
}

resource "aws_subnet" "custom_public_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.public_cidr_block
  availability_zone       = var.public_subnet_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "custom_public_subnet"
  }
}

resource "aws_subnet" "custom_private_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.private_cidr_block
  availability_zone = var.private_subnet_availability_zone

  tags = {
    Name = "custom_private_subnet"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
      cidr_block  = "0.0.0.0/0"
      instance_id = aws_instance.nat_ec2.id
  }
  
  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.custom_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.custom_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_instance" "nat_ec2" {
  ami                         = var.nat_ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [ aws_security_group.public_security_group.id ]
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.custom_public_subnet.id
  associate_public_ip_address = true
  source_dest_check           = false
  
  tags = {
    Name = "nat_ec2"
  }
}