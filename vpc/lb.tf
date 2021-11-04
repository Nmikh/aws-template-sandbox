resource "aws_lb_target_group" "lb_target_group" {
  vpc_id   = aws_vpc.custom_vpc.id
  protocol = "HTTP"
  port     = 80

  tags = {
    Name   = "lb_target_group"
  }

}

resource "aws_lb" "lb" {
  load_balancer_type = "application"
  internal           = false
  security_groups    = [ aws_security_group.public_security_group.id ]
  subnets            = [ aws_subnet.custom_public_subnet.id, aws_subnet.custom_private_subnet.id ]

  tags = {
    Name   = "lb"
  }
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.lb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "public_lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.public_ec2.id
}

resource "aws_lb_target_group_attachment" "private_lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.private_ec2.id
}