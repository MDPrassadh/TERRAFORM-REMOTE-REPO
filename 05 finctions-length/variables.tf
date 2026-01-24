variable "instance_name" {

  type        = list(string)
  default     = ["mysql-1", "backend-2", "frontend-3"]
  description = "Name tag for the EC2 instances"
  
}