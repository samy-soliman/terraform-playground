variable "subnet_config" {
  type = map(list(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags = map(string)
  })))
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

