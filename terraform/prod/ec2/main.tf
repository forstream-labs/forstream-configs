data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_security_group" "forstream" {
  name = "forstream"
  description = "forstream"

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "forstream"
    Environment = var.environment
  }
}

resource "aws_ebs_volume" "forstream" {
  availability_zone = "${var.region}e"
  size = 30

  tags = {
    Name = "forstream"
    Environment = var.environment
  }
}

resource "aws_instance" "forstream" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = "${var.region}e"
  security_groups = [aws_security_group.forstream.name]
  key_name = "forstream"

  tags = {
    Name = "forstream"
    Environment = var.environment
  }
}

resource "aws_volume_attachment" "forstream" {
  device_name = "/dev/xvdf"
  volume_id = aws_ebs_volume.forstream.id
  instance_id = aws_instance.forstream.id
}