terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "github" {
  token = "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"
}