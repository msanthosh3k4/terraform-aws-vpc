resource "aws_vpc_peering_connection" "peering" {
  count = var.ispeering_required ? 1 : 0
  vpc_id        = aws_vpc.main.id #requestor
  peer_vpc_id        = local.default_vpc  #acceptor
  auto_accept   = true
  tags = merge(
    local.vpc_tags,
      {
        Name = "${var.resource_name}-default"
      }
    )
}

resource "aws_route" "public-peering" {
    count = var.ispeering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = local.default_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "private-pering" {
    count = var.ispeering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = local.default_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "database-peering" {
    count = var.ispeering_required ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = local.default_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}