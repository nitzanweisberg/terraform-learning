resource "aws_vpc" "TF_nitzan" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "Terraform VPC example"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.TF_nitzan.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.TF_nitzan.id}"
  availability_zone = "eu-west-3a"
  tags {
    Name = "TF_Subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.TF_nitzan.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.TF_nitzan.id}"
  availability_zone = "eu-west-3b"
  tags {
    Name = "TF_Subnet2"
  }
}
resource "aws_security_group" "TF_SG" {
  vpc_id = "${aws_vpc.TF_nitzan.id}"
  tags {
    Name = "TF_SG"
  }
  ingress {
      cidr_blocks = [
        "${aws_vpc.TF_nitzan.cidr_block}"
      ]

    from_port = 80
    protocol = "tcp"
    to_port = 80
  }

}
nitzan