terraform {
  backend "s3" {
    bucket = "worth-kubernetes-state-new"
    region = "eu-west-2"
    key    = "terraform-digitalocean-state"
  }
}
