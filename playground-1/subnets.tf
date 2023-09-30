resource "aws_subnet" "iti-public-subnet-useast1a" {
  vpc_id                  = aws_vpc.iti-vpc.id
  cidr_block              = "10.0.1.0/24" 
  availability_zone       = "us-east-1a"  
  map_public_ip_on_launch = true 
  tags = {
    Name = "iti-iac-public-subnet-useast1a"
    project = "iti-terraform"
  }  
}

resource "aws_subnet" "iti-public-subnet-useast1b" {
  vpc_id                  = aws_vpc.iti-vpc.id
  cidr_block              = "10.0.2.0/24" 
  availability_zone       = "us-east-1b"  
  map_public_ip_on_launch = true 
  tags = {
    Name = "iti-iac-public-subnet-useast1b"
    project = "iti-terraform"
  }  
}

resource "aws_subnet" "iti-private-subnet-useast1a" {
  vpc_id                  = aws_vpc.iti-vpc.id
  cidr_block              = "10.0.3.0/24" 
  availability_zone       = "us-east-1a"  
  tags = {
    Name = "iti-iac-private-subnet-useast1a"
    project = "iti-terraform"
  }  
}

resource "aws_subnet" "iti-private-subnet-useast1b" {
  vpc_id                  = aws_vpc.iti-vpc.id
  cidr_block              = "10.0.4.0/24" 
  availability_zone       = "us-east-1b"  
  tags = {
    Name = "iti-iac-private-subnet-useast1b"
    project = "iti-terraform"
  }  
}
