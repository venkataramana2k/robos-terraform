module "ec2" {
  source = "./ec2"
  name = "frontend"
}

module "s2" {
  source = "./ec2"
  name = "mongodb"
}

output "skype_ip" {
  value = module.ec2.skype_ip
}