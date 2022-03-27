provider "aws" {
  region     = "us-west-2"
   = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxx+KsTwKVFWGuo1sp1fRJo4g"
}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.az


  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "https"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

}
