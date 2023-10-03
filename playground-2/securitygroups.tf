#### public security groups 

resource "aws_security_group" "iti-securitygroup-public" {
  name        = "securitygroup-public"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.iti-vpc.id

  tags = {
    Name = "iti-iac-securitygroup-public"
    project = var.project_tag
  }
}

resource "aws_vpc_security_group_ingress_rule" "iti-securitygrouprule-ingress-ssh" {
  security_group_id = aws_security_group.iti-securitygroup-public.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  tags = {
    Name = "iti-iac-securitygrouprule-ingress-ssh"
    project = var.project_tag
  }
}

resource "aws_vpc_security_group_egress_rule" "iti-securitygrouprule-egress-all" {
  security_group_id = aws_security_group.iti-securitygroup-public.id

  ip_protocol       = "-1"  # This means all protocols
  cidr_ipv4         = "0.0.0.0/0"
  tags = {
    Name = "iti-iac-securitygrouprule-egress-all"
    project = var.project_tag
  }
}


#### private security groups 

resource "aws_security_group" "iti-securitygroup-private" {
  name        = "securitygroup-private"
  description = "Allow SSH inbound and port 3000 traffic"
  vpc_id      = aws_vpc.iti-vpc.id

  tags = {
    Name = "iti-iac-securitygroup-private"
    project = var.project_tag
  }
}

resource "aws_vpc_security_group_ingress_rule" "iti-securitygrouprule-private-ingress-ssh" {
  security_group_id = aws_security_group.iti-securitygroup-private.id

  cidr_ipv4   = aws_vpc.iti-vpc.cidr_block
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  tags = {
    Name = "iti-iac-securitygrouprule-private-ingress-ssh"
    project = var.project_tag
  }
}

resource "aws_vpc_security_group_ingress_rule" "iti-securitygrouprule-private-ingress-web" {
  security_group_id = aws_security_group.iti-securitygroup-private.id

  cidr_ipv4   = aws_vpc.iti-vpc.cidr_block
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
  tags = {
    Name = "iti-iac-securitygrouprule-private-ingress-ssh"
    project = var.project_tag
  }
}

resource "aws_vpc_security_group_egress_rule" "iti-securitygrouprule-private-egress-all" {
  security_group_id = aws_security_group.iti-securitygroup-private.id
  ip_protocol       = "-1"  # This means all protocols
  cidr_ipv4         = "0.0.0.0/0"
  tags = {
    Name = "iti-iac-securitygrouprule-private-egress-all"
    project = var.project_tag
  }
}