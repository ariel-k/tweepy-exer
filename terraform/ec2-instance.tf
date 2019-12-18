provider "aws" {
    region = "us-east-2"
}
providers {
    ansible = "/usr/local/bin/terraform-provisioner-ansible"
}
# finding the right Centos AMI to install on  our server
data "aws_ami" "centos" {
    most_recent = true
    owners = ["amazon"]
}
resource "aws_instance" "centos-instance" {
    ami = "${data.aws_ami.centos.id}"
    instance_type = "t2.micro"
}

resource "aws_eip" "eip_centos" {
    vpc = true
}

resource "aws_eip_association" "eip_centos_assoc" {
    instance_id   = "${aws_instance.centos-instance.id}"
    allocation_id = "${aws_eip.eip_centos.id}"
}
