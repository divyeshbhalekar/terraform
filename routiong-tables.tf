resource "aws_route_table" "public" {

  # The vp ID (from vpc.tf file)
  vpc_id = aws_vpc.terraform-prac-iaas.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public"
  }

}

# private route table

resource "aws_route_table" "private" {

  # The vp ID (from vpc.tf file)
  vpc_id = aws_vpc.terraform-prac-iaas.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw1.id
  }

  tags = {
    Name = "private"
  }

}

# private route table 2

resource "aws_route_table" "private2" {

  # The vp ID (from vpc.tf file)
  vpc_id = aws_vpc.terraform-prac-iaas.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw2.id
  }

  tags = {
    Name = "private2"
  }

}