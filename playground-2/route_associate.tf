# Error: A single static variable reference is required: only attribute access and indexing with
# constant keys. No calculations, function calls, template expressions, etc are allowed here.

# Define a mapping from subnet ID to route table ID based on map_public_ip_on_launch
locals {
  subnet_to_route_table = {
    for key, value in var.subnet_config :
    key => value[0].map_public_ip_on_launch ? aws_route_table.iti-routetable-internetgateway.id : aws_route_table.iti-routetable-natgateway.id
  }
}

# Create the aws_route_table_association resources
resource "aws_route_table_association" "iti-routeassociates" {
  for_each = var.subnet_config

  depends_on = [
    aws_route_table.iti-routetable-internetgateway,
    aws_route_table.iti-routetable-natgateway
  ]

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = local.subnet_to_route_table[each.key]
}
