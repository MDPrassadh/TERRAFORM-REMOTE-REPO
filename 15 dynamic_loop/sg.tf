resource "aws_security_group" "allow_SSH_terraform" {
  name        = "allow_SSH"
  description = "allow_SSH 22,80,8080,3306 ports aws_security_group"

  # Usually we allow everything in egress rules free to go 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Terraform will give us through Dynamic block variable with block name
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {

      from_port   = ingress.value["from_port"]
      to_port     = ingress.value.to_port # we also doing like thiscontent {
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value["cidr_blocks"]
    }


  }

}