############ create ec2 instance in terraform ###############
resource "aws_instance" "web" {
  count = length(var.instances)   # or use the number directly
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name = var.instances[count.index]    ####### or also use element(var.instances, count.index)
  }
}

############## create aws_ami in terraform ##############
data "aws_ami" "example" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


variable "instances" {
  default = ["frontend", "mongodb", "catalogue"]
}