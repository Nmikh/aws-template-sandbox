provider "aws" {
  region  = var.aws_region
}

data "template_file" "public_init" {
  template = "${file("scripts/public.tpl")}"

  vars = {
    bucket_name  = var.bucket_name
    calc_jar  = var.calc_jar
  }
}

resource "aws_launch_template" "launch_template" {
  image_id               = var.ec2_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.public_security_group.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_profile.arn
  }

  user_data = "${base64encode(data.template_file.public_init.rendered)}"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "public_ec2"
    }
  }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  vpc_zone_identifier = [aws_subnet.custom_public_subnet_1.id, aws_subnet.custom_public_subnet_2.id]
  max_size            = 2
  min_size            = 2  
  target_group_arns   = [aws_lb_target_group.lb_target_group.arn]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

data "template_file" "private_init" {
  template = "${file("scripts/private.tpl")}"

  vars = {
    rds_hostname = aws_db_instance.postges.address
    bucket_name  = var.bucket_name
    persist_jar  = var.persist_jar
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [ aws_security_group.private_security_group.id ]
  key_name               = var.key_name
  iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.name}"
  subnet_id              = aws_subnet.custom_private_subnet_1.id
  depends_on             = [ aws_instance.nat_ec2 ]
  user_data              = data.template_file.private_init.rendered

  tags = {
    Name = "private_ec2"
  }
}