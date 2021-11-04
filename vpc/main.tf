provider "aws" {
  region  = var.aws_region
}

data "template_file" "private_init" {
  template = "${file("scripts/http.tpl")}"

  vars = {
    subnet_type = "private"
  }
}

data "template_file" "public_init" {
  template = "${file("scripts/http.tpl")}"

  vars = {
    subnet_type = "public"
  }
}

resource "aws_instance" "public_ec2" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [ aws_security_group.public_security_group.id ]
  key_name               = var.key_name
  subnet_id              = aws_subnet.custom_public_subnet.id
  user_data              = data.template_file.public_init.rendered

  tags = {
    Name = "public_ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [ aws_security_group.private_security_group.id ]
  key_name               = var.key_name
  subnet_id              = aws_subnet.custom_private_subnet.id
  depends_on             = [ aws_instance.nat_ec2 ]
  user_data              = data.template_file.private_init.rendered

  tags = {
    Name = "private_ec2"
  }
}