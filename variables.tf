variable "cidr_block" {

}

variable "enable_dns_hostnames" {
  default     = true
}

# variable "common_tags" {

# }

# variable "environment"{

# }

# variable "project_name" {
    
# }
variable "resource_name" {

}

variable "public_subnet_cidrs" {
  type = list
    validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Please provide 2 valid public subnet CIDR"
  }
}

variable "private_subnet_cidrs" {
    type = list
   validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "Please provide 2 valid private subnet CIDR"
  }
}

variable "database_subnet_cidrs" {
    type = list
   validation {
    condition     = length(var.database_subnet_cidrs) == 2
    error_message = "Please provide 2 valid private subnet CIDR"
  }
}

variable "ispeering_required" {
  default = false
}