variable "subnet_config" {
  type = map(list(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags = map(string)
  })))
  validation {
    condition     = length(keys(var.subnet_config)) == 4  
    error_message = "Error!, enter four subnets"
  }
}

variable "ec2-ami" {
  type = string
}

variable "instance_type" {
  type = string
}

#variable "associate_public_ip_address" {
#  type = bool
#}

#variable "ec2-availability_zone" {
#  type = string
#}

variable "vpc_cidr_block" {
    type = string
}

variable "project_tag" {
    type = string
}

variable "profile" {
    type = string
}

variable "region" {
    type = string
}

variable "key_name" {
  type = string
}

variable "remote_user" {
  type = string
}