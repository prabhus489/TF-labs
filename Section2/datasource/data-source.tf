provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA5RSSUULDTSMJCJEN"
  secret_key = "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"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}
