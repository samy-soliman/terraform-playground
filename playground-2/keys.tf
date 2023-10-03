#############################
#### public subnet key ######
#############################
resource "tls_private_key" "iti-rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "iti-terraform-public-key" {
  key_name = "${var.key_name}-key"
  public_key = tls_private_key.iti-rsa-key.public_key_openssh
  tags = {
    Name = "iti-iac-${var.key_name}"
    project = "iti-terraform"
  }
}

resource "local_file" "iti-terraform-public-private-key" {
  filename = "${var.key_name}-key.pem"
  content  = tls_private_key.iti-rsa-key.private_key_pem
}



#############################
#### private subnet key #####
#############################
resource "tls_private_key" "iti-rsa-private-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "iti-terraform-private-key" {
  key_name   = "${var.key_name}-private-key"  
  public_key = tls_private_key.iti-rsa-private-key.public_key_openssh
  tags = {
    Name = "iti-iac-${var.key_name}-private-key"
    project = "iti-terraform"
  }
}

resource "local_file" "iti-terraform-private-private-key" {
  filename = "${var.key_name}-private-key.pem"
  content  = tls_private_key.iti-rsa-private-key.private_key_pem
}