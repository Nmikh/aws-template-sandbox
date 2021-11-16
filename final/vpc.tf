resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "custom_vpc"
  }
}

resource "aws_subnet" "custom_public_subnet_1" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.public_cidr_block_1
  availability_zone       = var.public_subnet_availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "custom_public_subnet_1"
  }
}

resource "aws_subnet" "custom_public_subnet_2" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.public_cidr_block_2
  availability_zone       = var.public_subnet_availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "custom_public_subnet_2"
  }
}

resource "aws_subnet" "custom_private_subnet_1" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.private_cidr_block_1
  availability_zone       = var.private_subnet_availability_zone_1

  tags = {
    Name = "custom_private_subnet_1"
  }
}

resource "aws_subnet" "custom_private_subnet_2" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.private_cidr_block_2
  availability_zone       = var.private_subnet_availability_zone_2

  tags = {
    Name = "custom_private_subnet_2"
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

resource "aws_instance" "nat_ec2" {
  ami                         = var.nat_ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [ aws_security_group.public_security_group.id ]
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.custom_public_subnet_1.id
  associate_public_ip_address = true
  source_dest_check           = false
  
  tags = {
    Name = "nat_ec2"
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

resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.custom_public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.custom_public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.custom_private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.custom_private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}