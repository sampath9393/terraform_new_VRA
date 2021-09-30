
resource "aws_instance" "RAC-EC2" {
  ami = var.ami
  subnet_id = var.SUBNET_ID
  instance_type = var.instance_type_map[var.env]
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.ec2-sg.id ]
  tags = merge(
  local.common_tags,
  {"Name" = "RAC_APACHE"
   "env" = "var.env"}
  )

}


