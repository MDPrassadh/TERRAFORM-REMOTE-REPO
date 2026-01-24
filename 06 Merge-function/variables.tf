variable "instance_name" {

  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "Name tag for the EC2 instances"
  
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "expense-tracker"
    description = "Common tags to be applied to all resources"
  }
  
}
