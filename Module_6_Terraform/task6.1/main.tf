# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}

###################################################
## Create VPC and others
###################################################
resource "aws_vpc" "default" {
  cidr_block            = "10.0.0.0/16"
  enable_dns_hostnames  = true
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "default" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-10.0.1.0/24"
  }
  depends_on = [aws_vpc.default]
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "terraform-IGW"
  }
  depends_on = [aws_vpc.default]
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

###################################################
## Create Security Group
###################################################
resource "aws_security_group" "default" {
  name        = "terraform_example"
  description = "Used in the terraform"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-SG"
  }
  depends_on = [aws_vpc.default]
}

###################################################
## Create LB and SG for LB
###################################################
resource "aws_security_group" "elb" {
  name        = "terraform_example_elb"
  description = "Used in the terraform"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-SG_for_LB"
  }
}

resource "aws_elb" "web" {
  name = "terraform-example-elb"

  subnets         = [aws_subnet.default.id]
  security_groups = [aws_security_group.elb.id]
  instances       = aws_instance.web.*.id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  tags = {
    Name = "terraform-ELB"
  }
}

###################################################
## Create Instances and keys
###################################################
resource "aws_key_pair" "auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web" {
  count = 2
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-example-web-${count.index}"
  }
  ami = lookup(var.aws_ami, var.aws_region)
  # associate_public_ip_address = true
  key_name = aws_key_pair.auth.id
  vpc_security_group_ids = [aws_security_group.default.id]
  subnet_id = aws_subnet.default.id
  connection {
    user = "ubuntu"
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo dpkg --configure -a",
      "sudo apt-get install -f",
      "sudo apt-get clean && sudo apt-get update",
      "sudo apt-get -y install ${count.index != 1 ? "apache2" : "nginx"}",
    ]
  }
}