resource "aws_lb_target_group" "printo" {
  name        = "printo-target"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.default.id

  health_check {
    path     = "/health"
    protocol = "HTTP"
    port     = "3000"

    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30
    timeout             = 5
  }
}