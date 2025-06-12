output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id  # ✅ Directly reference the local resource
}

output "subnet_id_public" {
  description = "Subnet ID"
  value       = aws_subnet.public_subnet.id  # ✅ Directly reference the local resource
}

output "subnet_id_private" {
  description = "Subnet ID"
  value       = aws_subnet.private_subnet.id  # ✅ Directly reference the local resource
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.name.id
}