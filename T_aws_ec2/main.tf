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

# Create a security group for the load balancer
resource "aws_security_group" "T_lb_01" {
  name_prefix = "T_lb-"
  vpc_id      = aws_vpc.T_my_vpc_01.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.T_my_ip]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

# Allow incoming traffic to the load balancer from any source
resource "aws_security_group_rule" "T_lb_ingress_01" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.T_cidr_blocks
  security_group_id = aws_security_group.T_lb_01.id
}

# Create an AWS Application Load Balancer with two subnets and a security group
resource "aws_lb" "T_my_alb_01" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"

  subnets         = [aws_subnet.T_private_1.id, aws_subnet.T_private_2.id]
  security_groups = [aws_security_group.T_lb_01.id]

  tags = {
    Name = "${var.T_env_prefix}-my-alb"
  }
}

# Create an AWS Target Group for the instances
resource "aws_lb_target_group" "T_my_tg_01" {
  name_prefix = "my-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"

  vpc_id = aws_vpc.T_my_vpc_01.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    path                = "/"
    port                = "traffic-port"
  }
}

# Attach an instance to the target group
resource "aws_lb_target_group_attachment" "T_my_tg_attachment_01" {
  target_group_arn = aws_lb_target_group.T_my_tg_01.arn
  target_id        = aws_instance.T_instance_01.id
  port             = "80"
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
  key_name   = "server-key"
  public_key = file(var.T_key_name)
}

# Create aws_internet_gateway
resource "aws_internet_gateway" "T_my_igw_01" {
  vpc_id = aws_vpc.T_my_vpc_01.id

  tags = {
    Name = "${var.T_env_prefix}-my-igw"
  }
}

# Create aws_route_table
resource "aws_route_table" "T_my_route_table_01" {
  vpc_id = aws_vpc.T_my_vpc_01.id

  route {
    cidr_block = var.T_cidr_block
    gateway_id = aws_internet_gateway.T_my_igw_01.id
  }

  tags = {
    Name = "${var.T_env_prefix}-my-route-table"
  }
}
