output "iti-vpc" {
  value       = aws_vpc.iti-vpc.id   
  description = "Description of the output"
}

output "iti-vpc-cidr_block" {
  value       = aws_vpc.iti-vpc.cidr_block   
  description = "Description of the output"
}

output "iti-subnets" {
  value       =  aws_subnet.subnets   
  description = "Description of the output"
}