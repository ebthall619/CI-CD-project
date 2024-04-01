terraform {
  backend "s3" {
    bucket = "ebthalcicd"
    key    = "state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
