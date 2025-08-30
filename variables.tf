variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "common_tags" {
    type = map
    default = {
        terraform = "true"
        project = "expense"
    }
  
}

# variable "instance_names" {
#     type = list
#     default = ["frontned","backend","database"]
# }

variable "domain_name" {
    default = "sidthu.xyz"
  
}

variable "instance_names" {
    type = map
    default = {
        database = "t2.medium"
        frontned = "t2.micro"
        backend = "t2.micro"
    }
    
}


variable "inbound_rules" {
    default = [
        {
         port = 22
         protocol         = "tcp"
         cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            port = 80,
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }

    ]
  
}