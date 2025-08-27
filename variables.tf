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

variable "instance_names" {
    type = list
    default = ["frontned","backend","database"]
}

variable "domain_name" {
    default = "sidthu.xyz"
  
}