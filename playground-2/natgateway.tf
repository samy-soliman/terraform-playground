resource "aws_eip" "iti-nat-gateway-eip" {
  #domain = "vpc"
  tags = {
    Name = "iti-iac-nat-gateway-eip"
    project = "iti-terraform"
  }
}

resource "aws_nat_gateway" "iti-natgateway" {
  allocation_id = aws_eip.iti-nat-gateway-eip.id
  subnet_id     = aws_subnet.subnets["psubnet1"].id

  tags = {
    Name = "iti-iac-natgateway"
    project = "iti-terraform"
  }

  depends_on = [aws_eip.iti-nat-gateway-eip]
}

resource "aws_route_table" "iti-routetable-natgateway" {
  
  vpc_id = aws_vpc.iti-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.iti-natgateway.id
  }

  tags = {
    Name = "iti-iac-natgateway"
    project = "iti-terraform"
  }
  depends_on = [ aws_nat_gateway.iti-natgateway ]
}