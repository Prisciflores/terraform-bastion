provider "aws" {
  region = var.region
}

# -------------------------------
# Security Group para SSH
# -------------------------------
resource "aws_security_group" "bastion_sg" {
  name        = "${var.project_name}-bastion-sg"
  description = "Permite acceso SSH desde tu IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH desde tu IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr] # por ejemplo, "190.44.123.45/32"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-bastion-sg"
  }
}

# -------------------------------
# Instancia EC2 Bastión
# -------------------------------
resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"  # Free Tier elegible
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-bastion"
  }
}
