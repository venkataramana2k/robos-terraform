resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name = "venkata"
  }
}

data "aws_ami" "example" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


