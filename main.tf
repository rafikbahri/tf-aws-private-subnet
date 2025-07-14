resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = merge(
    {
      Name = var.name,
      kind = "private"
    },
    var.tags
  )
}

# Internet access for Private Subnet
resource "aws_route_table" "private" {
  count  = var.has_internet_access ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.ngw_id
  }

  tags = {
    Name = "PrivateSubnetInternetRouteTable"
  }
}

resource "aws_route_table_association" "internet" {
  count          = var.has_internet_access ? 1 : 0
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.private[0].id
}

