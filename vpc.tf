resource "aws_vpc" "terraform-prac-iaas" {
  # The CIDR Block for the VPC. 
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  # Required for Eks. Enable/Disable HostNames in the VPC
  enable_dns_hostnames = true

  # Required for Eks. Enable/Disable support in the VPC
  enable_dns_support = true

  /* # Enable/disable ClassiClink for the VPC.
  enable_classiclink = false

  # Enable/disable ClassiClink DNS Support for the VPC.
  enable_classiclink_dns_support = false */


  assign_generated_ipv6_cidr_block = false


  tags = {
    Name = "terraform-prac-iaas"
  }

}

output "vpc_id" {
  value       = aws_vpc.terraform-prac-iaas.id
  description = "VPC id."

  sensitive = false
}