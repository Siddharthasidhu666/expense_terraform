resource "aws_instance" "example" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_names[count.index] == "database" ? "t2.medium" : var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  count                  = length(var.instance_names)

  tags = merge(var.common_tags,
    {
      Name = var.instance_names[count.index]
    }

  )
}


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

resource "aws_route53_record" "www" {
  count   = length(var.instance_names)
  zone_id = "Z103450829TG9GCCQ3OTZ"
  name    = var.instance_names[count.index] == "frontned" ? "sidthu.xyz" : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = var.instance_names[count.index] == "frontned" ? [aws_instance.example[count.index].public_ip] : [aws_instance.example[count.index].private_ip]
}