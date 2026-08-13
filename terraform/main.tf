resource "aws_ecr_repository" "printo_app" {
  name                 = "printo-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "printo-app"
    Environment = "dev"
    Project     = "Printo-CICD"
  }
}

resource "aws_ecs_cluster" "printo" {
  name = "printo-cluster"

  tags = {
    Name        = "printo-cluster"
    Environment = "dev"
    Project     = "Printo-CICD"
  }
}