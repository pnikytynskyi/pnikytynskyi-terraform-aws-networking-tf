locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}

output "public_subnets" {
  description = "The ID and AZ of the public subnets"
  value       = local.output_public_subnets
}


output "private_subnets" {
  description = "The ID and AZ of the private subnets"
  value       = local.output_private_subnets
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}