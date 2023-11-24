data "aws_ec2_spot_price" "example" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "t2_micro_spot_price" {
  value = data.aws_ec2_spot_price.example.spot_price
}

###### aws security group datasource terraform  ######
data "aws_security_group" "selected" {
  id = "sg-06ddc4457f334b890"
}

output "allow_all_id" {
  value = data.aws_security_group.selected.vpc_id
}