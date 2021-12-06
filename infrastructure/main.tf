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

# Create some variables
locals {
  domain_name = "dixon.xyz"
}

# Create main bucket to hold website contents
resource "aws_s3_bucket" "root" {
    bucket = local.domain_name
    acl    = "public-read"

    website {
      index_document = "index.html"
      error_document = "error.html"
    }

    # Bucket policy to grant CloudFlare's servers s3:GetObject permission
    # See URL for latest server list: https://support.cloudflare.com/hc/en-us/articles/360037983412-Configuring-an-Amazon-Web-Services-static-site-to-use-Cloudflare
    policy = <<EOF
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${local.domain_name}/*",
            "Condition": {
              "IpAddress": {
                "aws:SourceIp": [
                  "2400:cb00::/32",
                  "2606:4700::/32",
                  "2803:f800::/32",
                  "2405:b500::/32",
                  "2405:8100::/32",
                  "2a06:98c0::/29",
                  "2c0f:f248::/32",
                  "173.245.48.0/20",
                  "103.21.244.0/22",
                  "103.22.200.0/22",
                  "103.31.4.0/22",
                  "141.101.64.0/18",
                  "108.162.192.0/18",
                  "190.93.240.0/20",
                  "188.114.96.0/20",
                  "197.234.240.0/22",
                  "198.41.128.0/17",
                  "162.158.0.0/15",
                  "172.64.0.0/13",
                  "131.0.72.0/22",
                  "104.16.0.0/13",
                  "104.24.0.0/14"
                ]
              }
            }
          }
        ]
      }
    EOF
}

# AWS S3 bucket for www-redirect
resource "aws_s3_bucket" "website_redirect" {
  bucket  = "www.${local.domain_name}"
  acl     = "public-read"

  website {
    redirect_all_requests_to = local.domain_name
  }
}
