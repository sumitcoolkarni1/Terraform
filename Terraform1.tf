provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWGG64QDPBP4VFE4M"
  secret_key = "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"
}

resource "aws_instance" "EC2" {
  ami           = "ami-0376ec8eacdf70aae"
  instance_type = "t2.micro"
  tags = { Name = "Linux"}
  security_groups = ["${aws_security_group.SG.name}"]
}

resource "aws_eip" "elasticip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.EC2.id
  allocation_id = aws_eip.elasticip.id
}

resource "aws_security_group" "SG" {
  name = "Securitygroup1"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.elasticip.public_ip}/32"]
  }
}