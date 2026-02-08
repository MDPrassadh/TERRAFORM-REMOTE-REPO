variable "ingress_rules" {
  default = [
    { port = 80, cidr = ["0.0.0.0/0"] },
    { port = 443, cidr = ["0.0.0.0/0"] },
    { port = 22, cidr = ["10.0.0.0/8"] }
  ]
}