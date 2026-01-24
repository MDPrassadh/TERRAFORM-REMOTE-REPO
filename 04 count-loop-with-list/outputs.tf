# output "public_ip" {
#   description = "The public IP address of the EC2 instance"
#   value       = aws_instance.backend.*.public_ip
#   sensitive = false
# }


# Just the list of public IPs
output "public_ips" {
  value = aws_instance.backend[*].public_ip
}

# Map of Name tag => public IP
output "instance_ips_with_tags" {
  value = {
    for inst in aws_instance.backend :
    inst.tags["Name"] => inst.public_ip
  }
}
