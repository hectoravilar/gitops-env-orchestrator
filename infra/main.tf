# Define the Terraform version and the AWS Provider configuration.
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuring the AWS Provider
provider "aws" {
  region = var.aws_region
}
