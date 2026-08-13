output "ecr_repository_url" {
  value = aws_ecr_repository.printo_app.repository_url
}

output "alb_dns_name" {
  value = aws_lb.printo.dns_name
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}