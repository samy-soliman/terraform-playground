# Define a variable to specify how many copies you want
variable "resource_count" {
  default = 2
}

# Create AWS EIP resources
resource "aws_eip" "iti-eips" {
  count = var.resource_count
  tags = {
    Name    = "iti-iac-eips-${count.index + 1}"
    project = "iti-terraform"
  }
}

# Create AWS NAT Gateway resources
resource "aws_nat_gateway" "iti-natgateways" {
  count         = var.resource_count
  allocation_id = aws_eip.iti-eips[count.index].id
  subnet_id     = aws_subnet.subnets["psubnet1"].id

  tags = {
    Name    = "iti-iac-natgateways-${count.index + 1}"
    project = "iti-terraform"
  }

  depends_on = [aws_eip.iti-eips]
}

# Create AWS Route Table resources
resource "aws_route_table" "iti-routetable-natgateways" {
  count = var.resource_count
  
  vpc_id = aws_vpc.iti-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.iti-natgateways[count.index].id
  }

  tags = {
    Name    = "iti-iac-routetable-natgateways-${count.index + 1}"
    project = "iti-terraform"
  }

  depends_on = [aws_nat_gateway.iti-natgateways]
}
