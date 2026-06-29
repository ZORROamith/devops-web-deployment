provider "aws" {
  region = "ap-southeast-2"
}


data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}


resource "aws_instance" "devops_server" {

  ami = data.aws_ami.ubuntu.id

  instance_type = "t3.micro"


  key_name = "devops-key"


  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              systemctl start docker
              systemctl enable docker
              EOF


  tags = {
    Name = "DevOps-Server"
  }

}
