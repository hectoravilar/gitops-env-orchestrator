resource "aws_ecr_repository" "gitops_ecr_repository" {
  name                 = "gitops-ecr-repository"
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
