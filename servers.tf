


data "aws_ami" "amzn-linux" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
}

#data "aws_security_group" "TF-SG" {
#  id = "sg-4c2ffc24"
#}


resource "aws_instance" "TF-Server" {
  ami = "${data.aws_ami.amzn-linux.id}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet1.id}"
  key_name = "Paris-sandbox"
  security_groups = [
    "sg-4c2ffc24" ]
  tags {
    Name = "TF-Server"
  }

}

##