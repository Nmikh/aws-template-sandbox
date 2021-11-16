resource "aws_lb_target_group" "lb_target_group" {
  vpc_id   = aws_vpc.custom_vpc.id
  protocol = "HTTP"
  port     = 80

  health_check {
    port = 80
    path = "/actuator/health"
  }


  tags = {
    Name   = "lb_target_group"
  }
}

resource "aws_lb" "lb" {
  load_balancer_type = "application"
  internal           = false
  security_groups    = [ aws_security_group.public_security_group.id ]
  subnets            = [ aws_subnet.custom_public_subnet_1.id, aws_subnet.custom_public_subnet_2.id ]

  tags = {
    Name   = "lb"
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}