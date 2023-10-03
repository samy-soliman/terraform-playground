# Error: A single static variable reference is required: only attribute access and indexing with
# constant keys. No calculations, function calls, template expressions, etc are allowed here.

# Define a mapping from subnet ID to route table ID based on map_public_ip_on_launch
#locals {
#  subnet_to_route_table = {
#    for key, value in var.subnet_config :
#    key => value[0].map_public_ip_on_launch ? aws_route_table.iti-routetable-internetgateway.id : aws_route_table.iti-routetable-natgateways.id
#  }
#}

# Create the aws_route_table_association for public resources
resource "aws_route_table_association" "iti-routeassociates-public" {
  count = 2

  depends_on = [
    aws_route_table.iti-routetable-internetgateway,
  ]

  subnet_id      = aws_subnet.subnets["psubnet${count.index + 1}"].id
  route_table_id = aws_route_table.iti-routetable-internetgateway.id
}

# Create the aws_route_table_association for private resources
resource "aws_route_table_association" "iti-routeassociates-private" {
  count = 2

  depends_on = [
    aws_route_table.iti-routetable-natgateways
  ]

  subnet_id      = aws_subnet.subnets["rsubnet${count.index + 1}"].id
  route_table_id = aws_nat_gateway.iti-natgateways[count.index].id
}

