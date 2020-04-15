variable "public_key_path" {
  default = "~/.ssh/terraform.pub"
}
variable "key_name" {
  default = "terraform"
}

variable "aws_region" {
  default     = "us-west-2"
}
# variable "aws_ami" {
#   default = "ami-0d1cd67c26f5fca19"
# }
variable "aws_ami" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-0d1cd67c26f5fca19"
  }
}