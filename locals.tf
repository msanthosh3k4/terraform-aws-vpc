# locals {
#   resource_name = "${var.project_name}-${var.environment}"
#   vpc_tags = {
#     terraform = true
#   }
# }
locals {
  vpc_tags = {
    terraform = true
  }
  az_available = slice(data.aws_availability_zones.available.names, 0, 2)
  default_vpc = data.aws_vpc.default_vpc.id
  default_cidr = data.aws_vpc.default_vpc.cidr_block
}
