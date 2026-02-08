
terraform {
  required_version = ">1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
  backend "s3" {
    bucket = "81s-locking-s3"
    key    = "dynamic-values-s3-lock"
    region = "us-east-1"
    #use_lockfile = true
    dynamodb_table = "tf.statelock"

  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}






































# **With Dynamic Blocks (DRY):**
# ```hcl
# variable "ingress_rules" {
#   default = [
#     { port = 80, cidr = ["0.0.0.0/0"] },
#     { port = 443, cidr = ["0.0.0.0/0"] },
#     { port = 22, cidr = ["10.0.0.0/8"] }
#   ]
# }

# resource "aws_security_group" "web" {
#   name = "web-sg"

#   dynamic "ingress" {
#     for_each = var.ingress_rules
#     content {
#       from_port   = ingress.value.port
#       to_port     = ingress.value.port
#       protocol    = "tcp"
#       cidr_blocks = ingress.value.cidr
#     }
#   }
# }
# ```

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

# ### Basic Dynamic Block Example

# ```hcl
# variable "subnet_cidrs" {
#   default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_network_acl" "main" {
#   vpc_id = aws_vpc.main.id

#   dynamic "ingress" {
#     for_each = var.subnet_cidrs
#     content {
#       protocol   = "tcp"
#       rule_no    = 100 + ingress.key
#       action     = "allow"
#       cidr_block = ingress.value
#       from_port  = 80
#       to_port    = 80
#     }
#   }
# }
# ```

# ### Using iterator Argument

# ```hcl
# dynamic "ingress" {
#   for_each = var.rules
#   iterator = rule  # Custom iterator name

#   content {
#     from_port   = rule.value.port
#     to_port     = rule.value.port
#     protocol    = rule.value.protocol
#     cidr_blocks = rule.value.cidrs
#   }
# }
# ```

# ### Nested Dynamic Blocks

# ```hcl
# variable "load_balancer_config" {
#   default = {
#     listeners = [
#       {
#         port     = 80
#         protocol = "HTTP"
#         rules = [
#           { path = "/api/*", target = "api" },
#           { path = "/web/*", target = "web" }
#         ]
#       },
#       {
#         port     = 443
#         protocol = "HTTPS"
#         rules = [
#           { path = "/*", target = "web" }
#         ]
#       }
#     ]
#   }
# }

# resource "aws_lb_listener" "main" {
#   for_each = { for idx, listener in var.load_balancer_config.listeners : idx => listener }

#   load_balancer_arn = aws_lb.main.arn
#   port              = each.value.port
#   protocol          = each.value.protocol

#   dynamic "default_action" {
#     for_each = each.value.rules
#     content {
#       type = "forward"
#       forward {
#         target_group {
#           arn = aws_lb_target_group.groups[default_action.value.target].arn
#         }
#       }
#     }
#   }
# }
# ```
