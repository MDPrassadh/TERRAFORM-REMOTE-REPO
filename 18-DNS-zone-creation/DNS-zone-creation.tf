
# Create a public hosted zone
resource "aws_route53_zone" "devopsinsights" {
  name = "devopsinsights.online"
}

output "nameservers" {
  value = aws_route53_zone.devopsinsights.name_servers
}




# Hosted zone for prassadhmulticloud.online
resource "aws_route53_zone" "prassadhmulticloud" {
  name = "prassadhmulticloud.online"
}

output "prassadhmulticloud_nameservers" {
  value = aws_route53_zone.prassadhmulticloud.name_servers
}