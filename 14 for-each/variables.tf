variable "instances" {
  type = map(string)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }


}

variable "zone_id" {
  default = "Z03935303DMMJM97SI3N5"
}

variable "domain_name" {
  default = "jioairlines.online"
}



