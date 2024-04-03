terraform {
  backend "s3" {
    bucket = "worth-k8s-hello-world-state"
    key    = "local-team/state"
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
