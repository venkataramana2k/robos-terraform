###### create ec2 instance terraform with vpc######
resource "aws_instance" "web" {
ami                    = data.aws_ami.example.id
instance_type          = "t2.micro"
vpc_security_group_ids = [aws_security_group.sg.id]

tags = {
Name = var.name
}
}

################ creating provisioner with null resource ################
resource "null_resource" "ansible" {
 depends_on = [aws_instance.web, aws_route53_record.www]   #### depends on this will create after this tasks
 provisioner "remote-exec" {
   connection {
     type     = "ssh"
     user     = "centos"
     password = "DevOps321"
     host     = aws_instance.web.public_ip
   }
   inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/venkataramana2k/robos-ansible roboshop.yml -e env=dev -e role_name=${var.name}"
     ]
  }
}
################# creating dns records #################
resource "aws_route53_record" "www" {
   zone_id = "Z0858447245XTBTK7DY06"
   name    = "${var.name}-dev"
   type    = "A"
   ttl     = 30
   records = [aws_instance.web.private_ip]
}
############ aws ami id datasource terraform #############
data "aws_ami" "example" {
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"
   owners           = ["973714476881"]
}

######### Security group terraform ##########
resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow TLS inbound traffic"

ingress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}

egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}

tags = {
Name = var.name
}
}

variable "name" {}
