resource "aws_ecs_task_definition" "printo_app" {
  family                   = "printo-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "256"
  memory = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = "printo-app"
      image     = "${aws_ecr_repository.printo_app.repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name        = "printo-app-task"
    Environment = "dev"
    Project     = "Printo-CICD"
  }
}