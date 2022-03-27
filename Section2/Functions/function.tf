provider "aws" {
  region     = var.region
  access_key = "AKIA5RSSUULDTSMJCJEN"
  secret_key = "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"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-west-2"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0323c3dd2da7fb37d"
    "us-west-2"  = "ami-0c2d06d50ce30b442"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}


output "timestamp" {
  value = local.time
}
