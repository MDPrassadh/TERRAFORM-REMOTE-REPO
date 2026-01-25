 variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "List of EC2 instance names"
}



variable "zone_id" {
  default = "Z03935303DMMJM97SI3N5"
}

variable "domain_name" {
  default = "jioairlines.online"
}

















# variable "instance_names" {
#     description = "List of EC2 instance names"
#     type        = list(string)
#     default     = ["mysql", "backend", "frontend"]

 