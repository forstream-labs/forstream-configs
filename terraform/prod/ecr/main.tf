resource "aws_ecr_repository" "forstream" {
  name = "forstream/forstream"

  tags = {
    Environment = var.environment
  }
}

resource "aws_ecr_repository" "forstream_live" {
  name = "forstream/forstream-live"

  tags = {
    Environment = var.environment
  }
}

resource "aws_ecr_repository" "forstream_web" {
  name = "forstream/forstream-web"

  tags = {
    Environment = var.environment
  }
}
