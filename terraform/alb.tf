resource "aws_lb" "printo" {
  name               = "printo-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = data.aws_subnets.default.ids

  tags = {
    Name    = "printo-alb"
    Project = "Printo-CICD"
  }
}