resource "aws_internet_gateway" "iti-internetgateway" {
  vpc_id = aws_vpc.iti-vpc.id
  tags = {
    Name = "iti-iac-internetgateway"
    project = "iti-terraform"
  } 
}

resource "aws_route_table" "iti-routetable-internetgateway" {
  vpc_id = aws_vpc.iti-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iti-internetgateway.id
  }
  tags = {
    Name = "iti-iac-routetable"
    project = "iti-terraform"
  } 
}
# no tag is accepted in here
resource "aws_route_table_association" "iti-routeassociate-useast1a" {
  subnet_id      = aws_subnet.iti-public-subnet-useast1a.id
  route_table_id = aws_route_table.iti-routetable-internetgateway.id
}

resource "aws_route_table_association" "iti-routeassociate-useast1b" {
  subnet_id      = aws_subnet.iti-public-subnet-useast1b.id
  route_table_id = aws_route_table.iti-routetable-internetgateway.id
}