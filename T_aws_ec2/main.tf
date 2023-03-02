resource "aws_instance" "T_instance_01" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.T_ssh_key_01.key_name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_key_pair" "T_ssh_key_01" {
  key_name   = var.key_name
  public_key = file(var.key_name)
}