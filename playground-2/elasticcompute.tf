#public instance

resource "aws_instance" "iti-instances-public" {
  #count = length()
  count         = 2  # Create two instances
  ami           = var.ec2-ami  
  instance_type = var.instance_type
  associate_public_ip_address = true
  #availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.iti-securitygroup-public.id]
  subnet_id = aws_subnet.subnets["psubnet${count.index + 1}"].id
  key_name = aws_key_pair.iti-terraform-public-key.key_name
  provisioner "local-exec" {
    command = "echo ${self.public_ip}  >> inventory "
    }
  tags = {
    Name = "iti-iac-instance-public-${count.index + 1}"
    project = var.project_tag
  }
  user_data = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.iti-rsa-private-key.private_key_pem}' > /home/var.remote_user/private_key.pem
              chmod 400 private_key.pem
              EOF
}

# private instance

resource "aws_instance" "iti-instances-private" {
  count         = 2  # Create two instances
  ami           = var.ec2-ami
  instance_type = var.instance_type
  #availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.iti-securitygroup-private.id]
  subnet_id = aws_subnet.subnets["rsubnet${count.index + 1}"].id
  key_name = aws_key_pair.iti-terraform-private-key.key_name
  tags = {
    Name = "iti-iac-instance-private"
    project = var.project_tag
  }
}