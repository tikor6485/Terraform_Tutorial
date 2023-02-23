resource "aws_instance" "TirdadKor" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name       = var.machine_name
    Created_By = "Terraform-Tirdad"
  }
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