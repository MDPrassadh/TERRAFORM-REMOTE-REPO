





resource "aws_instance" "terraform" {

    count                  = length(var.instance_names)
    ami                    = data.aws_ami.joindevops_ami.id
    instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    # Install httpd only on frontend
    #user_data = var.instance_names[count.index] == "frontend" ? local.httpd_script : ""
    # Always safe: use user_data_base64 with the helper
    user_data_base64 = var.instance_names[count.index] == "frontend" ? local.httpd_script_encoded : ""           
    tags = {
       Name = var.instance_names[count.index]
    }
    
} 





resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh" #allow_ssh is already there in my account
  description = "Allow port number 22 for SSH access"

  # usually we allow everything in egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }
  # Ingress: allow HTTP
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  # Ingress: allow HTTPS
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

}
