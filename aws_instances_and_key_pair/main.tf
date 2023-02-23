resource "aws_instance" "TirdadKor" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh-key.key_name

  tags = {
    Name       = var.machine_name
    Created_By = "Terraform-Tirdad"
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "server-key"
  public_key = file(var.key_name)
}


# resource "aws_instance" "TirdadKor" {
#   ami           = "ami-0aa7d40eeae50c9a9"
#   instance_type = "t2.micro"
#   key_name      = "dvh"

#   tags = {
#     Name       = "machine_name_01"
#     Created_By = "Terraform-Tirdad"
#   }
# }