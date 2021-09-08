variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "190.160.0.0/16"
}

variable "vsubnet_cidr" {
  default = ["190.160.1.0/24","190.160.2.0/24","190.160.3.0/24"]
}

#variable "availability_zone_names" {
  #type = "list" deprecated
#  type = list(string)
#  default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
#}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}
