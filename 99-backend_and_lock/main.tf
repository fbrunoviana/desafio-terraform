terraform {
  required_version = ">= 1.7.5"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.44.0"
    }
  }
  backend "s3" {
    bucket = "guelo-backend"
    key = "state/terraform.tstate"
    region = "sa-east-1"
    encrypt = true 
    dynamodb_table = "guelo-lock"
  }
}
provider "aws" {
  region = "sa-east-1"
}

resource "aws_s3_bucket" "s3_guelo_backend" {
  bucket = "guelo-backend"
  force_destroy = true
  tags = {
    "backend" = true
  }
}

resource "aws_dynamodb_table" "guelo-lock" {
  name = "guelo-lock"
  hash_key = "LockID"
  billing_mode   = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}
output "backend_name" {
  value = aws_s3_bucket.s3_guelo_backend.id
}

output "dynamodb_table" {
  value = aws_dynamodb_table.guelo-lock.id
}