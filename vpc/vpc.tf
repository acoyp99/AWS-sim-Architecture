resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true   
  enable_dns_hostnames = true

  tags = {
    Name = "sim_vpc"
  }
}

resource "aws_security_group" "ec2" {
    name = "sim-tech-ec2-sg"

    description = "EC2 security group (terraform-managed)"
    vpc_id      = aws_vpc.default.id

    # Permitir todo el trafico de entrada
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Permitir todo el trafico de salida
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
}

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.default.id
}

resource "aws_route" "private" {

  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks
  availability_zone = var.availability_zones
}

resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "private" {

  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "default" {
  depends_on = [aws_internet_gateway.default]


  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
}