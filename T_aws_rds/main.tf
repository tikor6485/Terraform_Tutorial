
# Creates a database subnet group to specify the subnets that the RDS instance can use
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.T_private_1.id, aws_subnet.T_private_2.id]

  tags = {
    Name = "my-db-subnet-group"
  }
}


# Creates a database security group to control the network access to the RDS instance
resource "aws_security_group" "my_db_security_group" {
  name_prefix = "T_db_s"
  vpc_id      = aws_vpc.T_my_vpc_01.id


  # Add ingress rule to allow traffic from an application server
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.T_my_ip] # Replace with the IP of the application server
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add egress rule to allow outbound traffic
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.T_env_prefix}-sg"
  }
}

# Creates a parameter group to configure database engine parameters
resource "aws_db_parameter_group" "my_db_parameter_group" {
  name   = "my-db-parameter-group"
  family = "mysql8.0"
  
  parameter {
    name  = "max_allowed_packet"
    value = "67108864"
  }
}


# Define the RDS instance
resource "aws_db_instance" "my_db_instance" {
  identifier                = "my-db"
  allocated_storage         = 20
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t2.micro"
  db_name                   = "mydb"
  username                  = "admin"
  password                  = "mysecret"
  storage_type              = "gp2"
  backup_retention_period   = 7

  # If set to true, a final snapshot is not created and the instance is immediately deleted.
  skip_final_snapshot       = true 
  final_snapshot_identifier = "my-final-db-snapshot"
  db_subnet_group_name      = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids    = [aws_security_group.my_db_security_group.id]

  tags = {
    Name = "My DB Instance"
  }
}


# Create a new VPC
resource "aws_vpc" "T_my_vpc_01" {
  cidr_block = var.T_vpc_cidr_block

  tags = {
    Name = "${var.T_env_prefix}-VPC"
  }
}

# Create two subnets in different Availability Zones in the VPC
resource "aws_subnet" "T_private_1" {
  cidr_block        = var.T_subnet_cidr_block_1
  availability_zone = var.T_avail_zone_1
  vpc_id            = aws_vpc.T_my_vpc_01.id

  tags = {
    Name = "${var.T_env_prefix}-Subnet-01"
  }
}

resource "aws_subnet" "T_private_2" {
  cidr_block        = var.T_subnet_cidr_block_2
  availability_zone = var.T_avail_zone_2
  vpc_id            = aws_vpc.T_my_vpc_01.id

  tags = {
    Name = "${var.T_env_prefix}-Subnet-02"
  }
}

# Create an EC2 instance for testing
resource "aws_instance" "T_instance_01" {
  ami           = var.T_instance_ami
  instance_type = var.T_instance_type
  key_name      = aws_key_pair.T_ssh_key.key_name


  subnet_id = aws_subnet.T_private_1.id

  tags = {
    Name = var.T_instance_name
  }
}

# Create a key pair for ssh

resource "aws_key_pair" "T_ssh_key" {
  key_name   = "${var.T_env_prefix}_server_key"
  public_key = file(var.T_key_name)
}