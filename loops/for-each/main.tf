for-each main.tf############ create ec2 instance in terraform ###############
resource "aws_instance" "web" {
for_each = var.instances
ami           = data.aws_ami.example.id
instance_type = lookup(each.value, "instance_type", "t2.micro" )

tags = {
Name = each.key
}
}

############## create aws_ami in terraform ##############
data "aws_ami" "example" {
most_recent = true
name_regex  = "Centos-8-DevOps-Practice"
owners      = ["973714476881"]
}


variable "instances" {
default = {
frontend = {
name = "frontend"
}
catalogue = {
instance_type= "t3.small"
}
cart = {
name = "cart"
instance_type= "t3.small"
}
}
}