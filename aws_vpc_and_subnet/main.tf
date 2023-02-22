
resource "aws_vpc" "development-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "Development_VPC_Name"
  }
}

resource "aws_subnet" "dev-subnet-01" {
  vpc_id     = aws_vpc.development-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Dev_Subnet_Name"
  }
}



#----------------------------------------------------

# resource "aws_vpc" "development-vpc" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "Development_VPC_Name"
#   }
# }

# resource "aws_subnet" "dev-subnet-01" {
#   vpc_id     = aws_vpc.development-vpc.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "Dev_Subnet_Name"
#   }
# }

#----------------------------------------------------
