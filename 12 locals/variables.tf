 variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "List of EC2 instance names"
}

