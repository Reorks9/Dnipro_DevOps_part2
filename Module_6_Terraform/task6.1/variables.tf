variable "public_key_path" {
  default = "~/.ssh/terraform.pub"
}
variable "key_name" {
  default = "terraform"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}
# variable "aws_amis" {
#   default = {
#     us-west-2 = "ami-0d1cd67c26f5fca19"
#   }