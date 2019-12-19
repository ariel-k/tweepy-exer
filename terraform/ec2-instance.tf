provider "aws" {
    region = "us-east-2"
}
# assign public IP 
resource "aws_eip" "eip_centos" {
    vpc = true
}
resource "aws_eip_association" "eip_centos_assoc" {
    instance_id   = "${aws_instance.centos-instance.id}"
    allocation_id = "${aws_eip.eip_centos.id}"
}
////////////////////////
# security group to control what requests can go in and out of the ec2 instance 
# in real world - you should limit from trusted servers [bastion host or VPN server]
resource "aws_security_group" "centos-instance-sg" {
  name = "allow-ssh-http"
# allow incoming SSH requests from any IP
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # allow incoming HTTP requests from any IP
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # allow incoming HTTPS requests from any IP
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
////////////////////////
# finding the right Centos AMI to install on  our server
data "aws_ami" "centos" {
    most_recent = true
    owners = ["amazon"]
}
# create ec2 instance 
resource "aws_instance" "centos-instance" {
    ami = "${data.aws_ami.centos.id}"
    instance_type = "t2.micro"
#   key_name = "ec2-key"
#   key_name = "${aws_key_pair.ec2_key.key_name}"
#   vpc_security_group_ids = ["${aws_security_group.centos-instance-sg.id}"]
    security_groups = ["${aws_security_group.centos-instance-sg.name}"]
    }
////////////////////////
# print public IP for access
output "public_ip" {
    value = "${aws_eip.eip_centos.public_ip}"
}

