output "sg_id" {
    value = aws_security_group.ec2.id
}

output "subnet_id" {
    value = aws_subnet.public.id
}