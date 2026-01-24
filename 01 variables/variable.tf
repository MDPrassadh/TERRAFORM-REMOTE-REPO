# #VARIABLES PREFERENCE ORDER 

# | Priority (Low → High) | Source                      | Example (RIGHT SIDE)                                     | Used? |
# | --------------------- | --------------------------- | -------------------------------------------------------- | ----- |
# | 1                     | `default` in `variables.tf` | `region = "us-east-1"`                                   | ❌     |
# | 2                     | Environment variable        | `TF_VAR_region=us-west-1`                                | ❌     |
# | 3                     | `terraform.tfvars`          | `region = "eu-west-1"`                                   | ❌     |
# | 4                     | `*.auto.tfvars`             | `region = "ap-south-1"`                                  | ❌     |
# | 5                     | `-var-file`                 | `terraform apply -var-file=prod.tfvars` → `ca-central-1` | ❌     |
# | 6                     | `-var` (CLI)                | `terraform apply -var="region=me-central-1"`             | ✅     |

# finally all are commented thren asking propmt 
# terraform plan
# var.instance_type
#   Enter a value: t3.small

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5" # ✅ valid in us-east-1
  description = "AMI ID of RHEL 9 image"
}

variable "instance_type" {
  type    = string
  #default = "t3.micro"
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "backend"
    Project     = "expense"
    Component   = "backend"
    Environment = "dev"
    terraform   = "true"
  }
}

variable "sg_name" {
  type    = string
  default = "allow_ssh"
}

variable "sg_description" {
  type    = string
  default = "Allow SSH inbound traffic port 22"
}

variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "ingress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
