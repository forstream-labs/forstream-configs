terraform {
  backend "s3" {
    region = "us-east-1"
    profile = "forstream"
    bucket = "forstream-terraform-tfstate"
    key = "tfstate"
    encrypt = true
  }
}
