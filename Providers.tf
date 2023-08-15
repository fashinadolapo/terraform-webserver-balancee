terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

  
# configure Aws provider 
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}
