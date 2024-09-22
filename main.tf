

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
data "aws_ami" "ubuntu" {

most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_security_group" "mysg"{
    name = "sg1"
    description = "allow inbound"
    ingress{
        description ="ssh into vpc"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
      ingress{
        description ="all traffic into vpc"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress{
        description ="outbound allowed"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]


    key_name      = "id_rsa"

  tags = {
    Name = "ANSIBLE"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
 
    private_key = file("C:/Users/admin/Desktop/PROJECT2/id_rsa")

    host        = "${self.public_ip}"
  }
  provisioner "remote-exec" {
    inline = [
     "sudo apt update",
     "sudo apt install -y software-properties-common",
     "sudo add-apt-repository --yes --update ppa:ansible/ansible",
     "sudo apt install -y ansible"
    ]
  }
}





