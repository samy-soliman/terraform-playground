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
