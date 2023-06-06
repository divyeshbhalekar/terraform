resource "aws_eip" "nat1" {

  tags = {
    Name = "terraform-prac-iaas"
  }

  # EIP may requirre igw to exist prior to association
  depends_on = [aws_internet_gateway.gw]

}

resource "aws_eip" "nat2" {

  tags = {
    Name = "terraform-prac-iaas"
  }

  # EIP may requirre igw to exist prior to association
  depends_on = [aws_internet_gateway.gw]

}