resource "aws_route_table_association" "public" {
  # The subnet ID to create an association.connection (from subnet.tf file)
  subnet_id = aws_subnet.public_ap_south_1a.id

  # The id of the routing table to associated with (public routing for instance from route-table.tf file)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  # The subnet ID to create an association.connection (from subnet.tf file)
  subnet_id = aws_subnet.public_ap_south_1b.id

  # The id of the routing table to associated with (public routing for instance from route-table.tf file)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  # The subnet ID to create an association.connection (from subnet.tf file)
  subnet_id = aws_subnet.private_ap_south_1a.id
  # The id of the routing table to associated with (public routing for instance from route-table.tf file)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  # The subnet ID to create an association.connection (from subnet.tf file)
  subnet_id = aws_subnet.private_ap_south_1b.id
  # The id of the routing table to associated with (public routing for instance from route-table.tf file)
  route_table_id = aws_route_table.private2.id
}