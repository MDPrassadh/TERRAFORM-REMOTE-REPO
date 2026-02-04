variable "ingress_rules" {
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = " Opening 22 SSH port"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening 80 HTTP port"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = " Opening 8080 web application port"
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = " Opening mysql port"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = " Opening HTTPS port"
    }
  ]

}