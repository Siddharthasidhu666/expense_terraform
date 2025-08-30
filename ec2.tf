# resource "aws_instance" "example" {
#   ami      = data.aws_ami.ubuntu.id
#   for_each = var.instance_names
#   #instance_type          = var.instance_names[count.index] == "database" ? "t2.medium" : var.instance_type
#   instance_type          = each.value
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   #count                  = length(var.instance_names)

#   tags = merge(var.common_tags,
#     {
#       #Name = var.instance_names[count.index]
#       Name = each.key
#     }

#   )
# }


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["973714476881"]
}

# resource "aws_route53_record" "www" {
#   #count   = length(var.instance_names)
#   zone_id = "Z103450829TG9GCCQ3OTZ"
#   name    = var.instance_names[count.index] == "frontned" ? "sidthu.xyz" : "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 300
#   records = var.instance_names[count.index] == "frontned" ? [aws_instance.example[count.index].public_ip] : [aws_instance.example[count.index].private_ip]
# }

# resource "aws_route53_record" "name" {
#   for_each = aws_instance.example
#   zone_id  = "Z103450829TG9GCCQ3OTZ"
#   name     = each.key == "frontned" ? var.domain_name : "${each.key}.${var.domain_name}"
#   type     = "A"
#   ttl      = 300
#   records  = each.key == "frontned" ? [each.value.public_ip] : [each.value.private_ip]
# }


# resource "aws_instance" "example" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   # provisioner "local-exec" {
#   #   command = "echo The server's IP address is ${self.private_ip} > ip.txt" 
#   # }

#   connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     password = "DevOps321"
#     host     = self.public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo dnf install ansible -y",
#       "sudo dnf install nginx -y",
#       "sudo systemctl start nginx"
#     ]
#   }
# }
