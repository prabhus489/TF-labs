provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

variable "istest" {}

resource "aws_instance" "dev" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
  count         = var.istest == true ? 3 : 0 #condition ? true_val :false_val
}

resource "aws_instance" "prod" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = "t2.large"
  count         = var.istest == false ? 1 : 0 #condition ? true_val :false_val
}
