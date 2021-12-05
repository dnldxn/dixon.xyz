terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "b" {
    bucket = "dixon.xyz"
    acl    = "public-read"

    website {
      index_document = "index.html"
      error_document = "error.html"
    }
  }
