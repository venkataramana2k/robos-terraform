terraform {
  backend "s3" {
    bucket = "sadgurubucketterraform"
    key = "sadguru/sample"
    region = "us-east-1"
  }
}
output "sample" {
  value = "Mango is a fruit"
}