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

variable "vpc_cidr_block" {
    type = string
}

variable "project_tag" {
    type = string
}
