

# use output.instances_info
# output.instances_info == aws_instance.expense
output "instances_info" {
  value = aws_instance.expense
}

# output "instances_info" {
#     value = aws_instance.expense

# }

# output "instance_ips_with_tags" {
#   value = {
#     for inst in aws_instance.expense :
#     inst.tags["Name"] => inst.public_ip 

#   }
# }

output "instance_ips_with_tags" {
  value = {
    for inst in aws_instance.expense :
    inst.tags["Name"] => {
      public_ip  = inst.public_ip
      private_ip = inst.private_ip
    }
  }
}

