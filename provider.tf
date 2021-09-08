provider "aws" {
  region     = "${var.region}"
}
 
resource "aws_vpc" "my_tf_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "my_tf_vpc"
    Location = "Bengaluru"
  }
}
  
resource "aws_subnet" "my_tf_vpc_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.my_tf_vpc.id}"
  cidr_block = "${element(var.vsubnet_cidr,count.index)}"

  tags = {
    Name = "my_tf_vpc_subnet-${count.index+1}"
  }
}
