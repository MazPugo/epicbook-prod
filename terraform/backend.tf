terraform {
  backend "s3" {
    bucket         = "epicbook-tfstate"
    key            = "terraform/state"
    region         = "eu-west-2"
  }
}
