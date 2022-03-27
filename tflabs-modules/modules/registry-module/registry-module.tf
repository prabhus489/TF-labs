provider "aws" {
  region     = "us-west-2"
   = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxx+KsTwKVFWGuo1sp1fRJo4g"
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = 1

  ami           = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
  subnet_id     = "subnet-c968db83"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

#https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/2.21.0
