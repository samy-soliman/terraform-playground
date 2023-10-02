resource "aws_subnet" "subnets" {
  for_each = var.subnet_config

  vpc_id                  = aws_vpc.iti-vpc.id
  cidr_block              = var.subnet_config[each.key][0].cidr_block
  availability_zone       = var.subnet_config[each.key][0].availability_zone
  map_public_ip_on_launch = var.subnet_config[each.key][0].map_public_ip_on_launch
  tags                    = var.subnet_config[each.key][0].tags
}