variable "instance_name" {

  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "Name tag for the EC2 instances"
  
}