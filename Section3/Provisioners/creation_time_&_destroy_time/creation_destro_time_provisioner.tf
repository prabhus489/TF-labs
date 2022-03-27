
provider "aws" {
  region     = "us-west-2"
   = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxx+KsTwKVFWGuo1sp1fRJo4g"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH into VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}



resource "aws_instance" "myec2" {
  ami                    = "ami-0c2d06d50ce30b442"
  instance_type          = "t2.micro"
  key_name               = "tflabs-terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]


  provisioner "remote-exec" {
    inline = [
      "sudo yum install nano -y"
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum remove nano -y"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./tflabs-terraform.pem")
    host        = self.public_ip
    port        = 22
    timeout     = "2m"
  }
}
