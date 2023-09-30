resource "aws_eip" "iti-nat-gateway-eip" {
  #domain = "vpc"
  depends_on = [
    aws_route_table_association.iti-routeassociate-useast1a
  ]
  tags = {
    Name = "iti-iac-nat-gateway-eip"
    project = "iti-terraform"
  }
}

resource "aws_nat_gateway" "iti-natgateway" {
  allocation_id = aws_eip.iti-nat-gateway-eip.id
  subnet_id     = aws_subnet.iti-public-subnet-useast1a.id

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

resource "aws_route_table_association" "iti-routeassociate-nat-useast1a" {
  depends_on = [
    aws_route_table.iti-routetable-natgateway
  ]

  subnet_id      = aws_subnet.iti-private-subnet-useast1a.id   # private

  route_table_id = aws_route_table.iti-routetable-natgateway.id
}

resource "aws_route_table_association" "iti-routeassociate-nat-useast1b" {
  depends_on = [
    aws_route_table.iti-routetable-natgateway
  ]

  subnet_id      = aws_subnet.iti-private-subnet-useast1b.id   # private

  route_table_id = aws_route_table.iti-routetable-natgateway.id
}