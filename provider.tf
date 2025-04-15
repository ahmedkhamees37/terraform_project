terraform {
  backend "s3" {
    bucket         = "bucket-tf-state37"
    region         = "us-east-1"
    key            = "terraform.tfstate"
    # dynamodb_table = "iti-terrafrom-LockID"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = var.region
  # access_key = ""
  # secret_key = ""
  # token      = ""
  }
