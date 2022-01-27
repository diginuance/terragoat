provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "93d2d66ea909afce19e9dbef4bfe0c6889fdee27"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-01-27 18:26:30"
    git_last_modified_by = "muasif80@gmail.com"
    git_modifiers        = "muasif80"
    git_org              = "diginuance"
    git_repo             = "terragoat"
    yor_trace            = "183e0383-905d-47aa-a805-f9fe82c0a135"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "93d2d66ea909afce19e9dbef4bfe0c6889fdee27"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-01-27 18:26:30"
    git_last_modified_by = "muasif80@gmail.com"
    git_modifiers        = "muasif80"
    git_org              = "diginuance"
    git_repo             = "terragoat"
    yor_trace            = "908447bc-2c4d-45ef-a69a-db469251ff8f"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
