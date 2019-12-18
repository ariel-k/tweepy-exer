provider "aws" {
    access_key = "AKIAIONRBRMCFRLAQ2ZA"
    secret_ket = "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"
    region = "us-east-2a"
}

# finding the right Centos AMI to install on  our server
data "aws_ami" "centos" {
    most_recent = true
}

resource "aws_instance" "instace-centos" {
    ami           = "${data.aws_ami.centos.id}"
    instance_type = "t2.micro"
    tags {
        Name = "instance-centos"
  }
}
