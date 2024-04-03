terraform {
  backend "s3" {
    bucket = "violet-hall-terraform-states-kerv"
    key    = "kuberetes-example/state"
    region = "eu-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.41.0"
    }
  }

  required_version = "~> 1.7.5"
}
