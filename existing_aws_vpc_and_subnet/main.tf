
resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"

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


# Create Subnet for existing VPC

data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "dev-subnet-exist-01" {
  vpc_id = data.aws_vpc.existing_vpc.id
  # The ip is from default vpc
  # Each subnet inside a VPC has to have a different set of IP addresses!
  # So, we should use the next IP range.
  cidr_block = "172.31.96.0/20"

  tags = {
    Name = "Dev_Subnet_Exist_Name"
  }
}

