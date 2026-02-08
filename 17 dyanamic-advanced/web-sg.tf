resource "aws_security_group" "web" {
  name = "web-sg"

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr
    }
  }
}

# ### Dynamic Block Syntax

# ```hcl
# dynamic "<BLOCK_NAME>" {
#   for_each = <COLLECTION>
#   iterator = <ITERATOR_NAME>  # Optional, defaults to block name
  
#   content {
#     # Block configuration using iterator.value
#   }
# }
# ```