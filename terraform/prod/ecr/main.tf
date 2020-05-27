resource "aws_ecr_repository" "forstream" {
  name = "forstream/forstream"

  tags = {
    Environment = var.environment
  }
}
