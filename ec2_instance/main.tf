resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instances.id]
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address

  iam_instance_profile = var.instance_profile_name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"
  }

  tags = merge({
    Name = var.name
  }, var.tags)
}

resource "aws_security_group" "instances" {
  name        = var.name
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id
  tags        = merge(var.tags, {
    "Name": var.name
  })
}

resource "aws_security_group_rule" "allow_outbound" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.instances.id
}

resource "aws_security_group_rule" "allow_inbound_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.instances.id
}
