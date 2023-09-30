#public instance

resource "aws_instance" "iti-instance-public" {
  ami           = "ami-053b0d53c279acc90"  # ubuntu us-east-1a
  instance_type = "t2.micro"
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.iti-securitygroup-public.id]
  subnet_id = aws_subnet.iti-public-subnet-useast1a.id
  key_name = aws_key_pair.iti-terraform-public-key.key_name
  tags = {
    Name = "iti-iac-instance-public"
    project = "iti-terraform"
  }
}

# private instance

resource "aws_instance" "iti-instance-private" {
  ami           = "ami-053b0d53c279acc90"  # ubuntu us-east-1a
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.iti-securitygroup-private.id]
  subnet_id = aws_subnet.iti-private-subnet-useast1a.id
  key_name = aws_key_pair.iti-terraform-private-key.key_name
  tags = {
    Name = "iti-iac-instance-private"
    project = "iti-terraform"
  }
}