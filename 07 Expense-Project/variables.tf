


variable "instance_names" {

  type        = list(string)
  default     = ["frontend", "backend", "mysql"]
  description = "Name tag for the EC2 instances"

}

variable "common_tags" {
  type = map(any)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "expense-tracker"
    description = "Common tags to be applied to all resources"
  }
}

variable "zone_id" {
  default = "Z03935303DMMJM97SI3N5"
}

variable "domain_name" {
  default = "jioairlines.online"
}

# variable "instance_names" {
#     type = list(string)
#     default = ["mysql", "backend", "frontend"]
# }

# variable "common_tags" {
#     type = map
#     default = {
#         Project = "expense"
#         Environment = "dev"
#         Terraform = "true"
#     }
# }

# variable "zone_id" {
#     default = "Z03935303DMMJM97SI3N5"
# }

#variable "domain_name" {
#     default = "jioairlines.online"
# }


# variable "instance_names" {
#     type = list(string)
#     default = ["mysql", "backend", "frontend"]
# }

# variable "common_tags" {
#     type = map
#     default = {
#         Project = "expense"
#         Environment = "dev"
#         Terraform = "true"
#     }
# }

# variable "zone_id" {
#     default = "Z03935303DMMJM97SI3N5"
# }

# variable "domain_name" {
#     default = "jioairlines.online"
# }