
# data "aws_ami" "DevOps-Practice" {

#     most_recent = true
#     owners     = ["973714476881"]

#     filter {
#         name = "name"
#         values = ["Redhat-9-Devops-Practice"]

#     }

#     filter {
#         name = "virtualization-type"
#         values = ["hvm"]
#     }

#     filter {
#         name = "root-device-type"
#         values = ["ebs"]
#     }
# }

data "aws_ami" "joindevops_ami" {
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }


}
