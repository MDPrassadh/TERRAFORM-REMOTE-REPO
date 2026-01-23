


# resource "aws_route53_zone" "main" {
#   name = "jioairlines.online"
# }
# resource "aws_route53_record" "expense" {
#     count = length(var.instance_names)
#     # As Of now No Hosted zone is there so we are creating one above and using that zone id here
#     zone_id = aws_route53_zone.main.zone_id
#     #backend.jioairlines.online
#     name = "www.${var.instance_names[count.index]}.${var.domain_name}"
#     type = "A"
#     ttl = 1
#     records = [aws_instance.expense[count.index].private_ip]
#     allow_overwrite = true
# }

#If you have your own hosted zone then use below code by uncommenting it and comment above aws_route53_record
# resource "aws_route53_record" "expense" {
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   #backend.jioairlines.online
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.expense[count.index].private_ip]
#   allow_overwrite = true
# }

# resource "aws_route53_record" "expense" {
#   count   = length(var.instance_names)
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 300
#   records = [
#     var.instance_names[count.index] == "frontend"
#     ? aws_instance.expense[count.index].public_ip
#     : aws_instance.expense[count.index].private_ip
#   ]
#   allow_overwrite = true
# }


# frontend.jioairlines.online → <Elastic/Public IP>
# backend.jioairlines.online  → <Elastic/Public IP>
# mysql.jioairlines.online    → <Elastic/Public IP>

# Public record (frontend)
# resource "aws_route53_record" "frontend" {
#   zone_id = var.zone_id_public
#   name    = "frontend.${var.domain_name}"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.expense[0].public_ip]   # assuming index 0 is frontend
#   allow_overwrite = true
# }

# # Private records (backend + mysql)
# resource "aws_route53_record" "private" {
#   count   = 2
#   zone_id = var.zone_id_private
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.expense[count.index + 1].private_ip] # adjust index
#   allow_overwrite = true
# }
# Public zone (frontend)
# resource "aws_route53_record" "frontend" {
#   zone_id = aws_route53_zone.public.zone_id
#   name    = "jioairlines.online"
#   type    = "A"

#   records = [aws_instance.frontend.public_ip]
# }

# # Private zone (backend + db)
# resource "aws_route53_record" "internal" {
#   count   = length(var.instance_names)
#   zone_id = aws_route53_zone.private.zone_id
#   name    = "${var.instance_names[count.index]}.jioairlines.online"
#   type    = "A"
#   ttl     = 300
#   allow_overwrite = true

#   records = [aws_instance.expense[count.index].private_ip]
# }
    
# resource "aws_route53_record" "expense" {
#   count   = length(var.instance_names)

#   zone_id = aws_route53_zone.expense.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 300
#   allow_overwrite = true

#   records = [
#     var.instance_names[count.index] == "frontend"
#     ? aws_instance.expense[count.index].public_ip
#     : aws_instance.expense[count.index].private_ip
#   ]
# }

# resource "aws_route53_record" "root" {
#   zone_id = aws_route53_zone.expense.zone_id
#   name    = var.domain_name
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.expense[0].public_ip]
# }

# -------------------------------
# Public Hosted Zone
# -------------------------------
# ----------------------------------
# ----------------------------------
# Route 53 Public Hosted Zone
# ----------------------------------
resource "aws_route53_zone" "expense" {
  name = var.domain_name
}

# ----------------------------------
# ROOT DOMAIN → FRONTEND EC2
# jioairlines.online
# ----------------------------------
resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.expense.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300

  records = [aws_instance.expense[0].public_ip]
}

# ----------------------------------
# Subdomains: frontend / backend / mysql
# ----------------------------------
resource "aws_route53_record" "expense" {
  count   = length(var.instance_names)

  zone_id = aws_route53_zone.expense.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  allow_overwrite = true

  records = [
    var.instance_names[count.index] == "frontend"
    ? aws_instance.expense[count.index].public_ip
    : aws_instance.expense[count.index].private_ip
  ]
}

# resource "aws_route53_record" "expense" {
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   #backend.jioairlines.online
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.expense[count.index].private_ip]
#   allow_overwrite = true
# }