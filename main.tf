provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "example" {
    ami           = "ami-086b16d6badeb5716"
    instance_type = "t2.micro"
    key_name = "workstation-key"
}


output "instance_key" {
    value = "${aws_instance.example.key_name}"
}
