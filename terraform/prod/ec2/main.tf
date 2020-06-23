data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20200430"]
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

  ingress {
    description = "RTMP"
    from_port = 1935
    to_port = 1935
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

resource "aws_instance" "forstream" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = "${var.region}e"
  security_groups = [aws_security_group.forstream.name]
  key_name = "forstream"

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  volume_tags = {
    Name = "forstream"
    Environment = var.environment
  }

  tags = {
    Name = "forstream"
    Environment = var.environment
  }
}

resource "aws_route53_record" "forstream_www_default" {
  zone_id = var.forstream_route_53_zone_id
  name = var.forstream_route_53_zone_name
  type = "A"
  ttl = 300
  records = [aws_instance.forstream.public_ip]
}

resource "aws_route53_record" "forstream_www" {
  zone_id = var.forstream_route_53_zone_id
  name = "www.${var.forstream_route_53_zone_name}"
  type = "A"
  ttl = 300
  records = [aws_instance.forstream.public_ip]
}

resource "aws_route53_record" "forstream_api" {
  zone_id = var.forstream_route_53_zone_id
  name = "api.${var.forstream_route_53_zone_name}"
  type = "A"
  ttl = 300
  records = [aws_instance.forstream.public_ip]
}

resource "aws_route53_record" "forstream_live" {
  zone_id = var.forstream_route_53_zone_id
  name = "live.${var.forstream_route_53_zone_name}"
  type = "A"
  ttl = 300
  records = [aws_instance.forstream.public_ip]
}
