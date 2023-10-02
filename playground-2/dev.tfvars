subnet_config = {
    psubnet1 = [
      {
        cidr_block              = "10.0.1.0/24"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = true
        tags = {
          Name    = "iti-iac-public-subnet-useast1a"
          project = "iti-terraform"
        }
      }
    ],
    psubnet2 = [
      {
        cidr_block              = "10.0.2.0/24"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
        tags = {
          Name    = "iti-iac-public-subnet-useast1b"
          project = "iti-terraform"
        }
      }
    ],
    rsubnet1 = [
      {
        cidr_block        = "10.0.3.0/24"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = false
        tags = {
          Name    = "iti-iac-private-subnet-useast1a"
          project = "iti-terraform"
        }
      }
    ],
    rsubnet2 = [
      {
        cidr_block        = "10.0.4.0/24"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = false
        tags = {
          Name    = "iti-iac-private-subnet-useast1b"
          project = "iti-terraform"
        }
      }
    ],
  }

ec2-ami = "ami-053b0d53c279acc90" # ubuntu us-east-1a
instance_type = "t2.micro"

vpc_cidr_block = "10.0.0.0/16"
     
project_tag = "iti-terraform"
    
profile = "terraform"
    
region = "us-east-2"
    