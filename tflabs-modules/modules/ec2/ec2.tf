
resource "aws_instance" "myec2" {
  ami           = "ami-0c2d06d50ce30b442"
  instance_type = var.instance_type
}
