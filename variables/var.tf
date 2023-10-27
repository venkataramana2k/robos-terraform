###########plain type variables
variable "plain" {
  default = "apple"
}

output "plain_output" {
  value = var.plain
}