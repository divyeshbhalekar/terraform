resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform-prac-iaas.id

  tags = {
    Name = "terraform-prac-iaas"
  }
}

output "gateway_id" {
  value       = aws_internet_gateway.gw.id
  description = "Internet Gateway id"
}