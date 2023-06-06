resource "aws_nat_gateway" "gw1" {

  # The allocation id of the elastic ip (from elastic-ip.tf file)
  allocation_id = aws_eip.nat1.id

  # The allocation id for the subnet (from subnet.tf file
  subnet_id = aws_subnet.public_ap_south_1a.id


  tags = {
    Name = "NAT 1"
  }
}

# Nat-gateway 2 

resource "aws_nat_gateway" "gw2" {

  # The allocation id of the elastic ip (from elastic-ip.tf file)
  allocation_id = aws_eip.nat2.id

  # The allocation id for the subnet (from subnet.tf file
  subnet_id = aws_subnet.public_ap_south_1b.id


  tags = {
    Name = "NAT 2"
  }
}