terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.61.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.15.1"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
}
