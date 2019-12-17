provider "aws" {
  region = "eu-central-1"
}
data "aws_ami" "centos" {
  most_recent = true
}
resource "aws_instance" "web" {
  ami = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
}


