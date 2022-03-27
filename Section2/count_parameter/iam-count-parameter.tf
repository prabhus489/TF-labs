provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

variable "elb_names" {
  type    = list(any)
  default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  #name  = "loadbalancer.${count.index}" #loadbalancer.0,loadbalancer.1...
  name  = var.elb_names[count.index]
  count = 3
  path  = "/system/"
}
