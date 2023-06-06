# private Subnets

resource "aws_subnet" "private_ap_south_1a" {
  vpc_id     = aws_vpc.terraform-prac-iaas.id
  cidr_block = "192.168.128.0/18"

  # The AZ for the subnet
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                            = "private_ap_south_1a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = "1"

  }
}
# private sunet -> 2
resource "aws_subnet" "private_ap_south_1b" {
  vpc_id     = aws_vpc.terraform-prac-iaas.id
  cidr_block = "192.168.192.0/18"

  # The AZ for the subnet
  availability_zone = "ap-south-1b"

  tags = {
    "Name"                            = "private_ap_south_1b"
    "kubernetes.io/cluster/demo"      = "shared"
    "kubernetes.io/role/internal-elb" = "1"

  }
}


# public subnets

resource "aws_subnet" "public_ap_south_1a" {
  vpc_id     = aws_vpc.terraform-prac-iaas.id
  cidr_block = "192.168.0.0/18"

  # The AZ for the subnet
  availability_zone = "ap-south-1a"

  # Required for EKS
  map_public_ip_on_launch = true

  tags = {
    "Name"                      = "public_ap_south_1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = "1"
  }
}

resource "aws_subnet" "public_ap_south_1b" {
  vpc_id     = aws_vpc.terraform-prac-iaas.id
  cidr_block = "192.168.64.0/18"

  # The AZ for the subnet
  availability_zone = "ap-south-1b"

  # Required for EKS
  map_public_ip_on_launch = true

  tags = {
    "Name"                      = "public_ap_south_1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = "1"
  }
}