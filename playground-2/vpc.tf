resource "aws_vpc" "iti-vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "iti-iac-vpc"
    project = var.project_tag
  }
}
