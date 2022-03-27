provider "aws" {
  region     = "us-west-2"
   = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxx+KsTwKVFWGuo1sp1fRJo4g"
}

resource "aws_instance" "myec2_1" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = var.types["ap-south-1"]
}

resource "aws_instance" "myec2_2" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = var.list[1]
}

variable "list" {
  type    = list(string)
  default = ["m5.large", "m5.xlarge", "t2.medium"]
}

variable "types" {
  type = map(string)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.small"

  }
}
