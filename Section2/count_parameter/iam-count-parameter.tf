provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA5RSSUULDTSMJCJEN"
  secret_key = "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"
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
