###########plain type variables
variable "plain" {
  default = "apple"
}

output "plain_output" {
  value = var.plain
}


#################list type variables
variable "list" {
  default = ["CLOUD", "DEVOPS", "AWS"]
}

output "list_output" {
  value = var.list
}