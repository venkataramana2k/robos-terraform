resource "aws_instance" "web" {
  count = length(var.instance)
  ami                    = data.aws_ami.example.id
  instance_type          = "t2.micro"

  tags = {
    Name = var.instance
  }
}


data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

variable "instance" {
  default = ["frontend","mongodb","catalogue"]
}