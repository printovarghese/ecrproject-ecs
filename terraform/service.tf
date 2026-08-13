resource "aws_ecs_service" "printo_app" {
  name            = "printo-app-service"
  cluster         = aws_ecs_cluster.printo.id
  task_definition = aws_ecs_task_definition.printo_app.arn

  desired_count = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets          = data.aws_subnets.default.ids
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.printo.arn
    container_name   = "printo-app"
    container_port   = 3000
  }

  depends_on = [
    aws_lb_listener.http
  ]

  tags = {
    Name        = "printo-app-service"
    Environment = "dev"
    Project     = "Printo-CICD"
  }
}