resource "aws_ecr_repository" "generator" {
  name = "${var.project_name}-${var.environment}-generator"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-generator"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}