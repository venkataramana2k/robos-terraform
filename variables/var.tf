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
  value = var.list[0]
}


#############map type variables
variable "map" {
  default = {
    cloud = {
      Time = "6AM"
      Duration = "300days"
    }
    devops = {
      Time = "9AM"
      Duration = "250days"
    }
  }
}

output "map_output" {
  value = var.map["cloud"]
}

################ tfvars while Runtime
variable "env" {}
output "tfvars_output" {
  value = var.env
}

variable "fruit" {}
output "fruit" {
  value = var.fruit
}
