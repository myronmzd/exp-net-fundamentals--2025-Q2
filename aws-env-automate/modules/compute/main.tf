resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name      = "mykey"
  vpc_security_group_ids = [var.security_group]
  
  tags = {
    Name = "ComputeInstance"
  }
}

resource "aws_network_interface" "extra_eni" {
  subnet_id       = var.subnet_id
  private_ips     = ["10.200.123.100"] # Pick any unused IP in 10.200.123.4 to 10.200.123.126
  security_groups = [var.security_group]

  tags = {
    Name = "ExtraENI"
  }
}

resource "aws_network_interface_attachment" "eni_attachment" {
  instance_id          = aws_instance.main.id
  network_interface_id = aws_network_interface.extra_eni.id
  device_index         = 1 # 0 = primary, 1 = secondary, etc.
}