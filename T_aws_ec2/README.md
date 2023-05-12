# AWS Infrastructure Deployment using Terraform

This is a Terraform configuration file to create a VPC with two subnets, an Application Load Balancer (ALB), an instance, and other necessary resources for AWS infrastructure deployment.


## Requirements

-    Terraform version >= 0.13
-    An AWS account with the necessary credentials and permissions.

## Usage

1-    Clone the repository and navigate to the directory where the file is located.

2-    Create a **'terraform.tfvars'** file and set the values for the variables defined in the **'variables.tf'** file.

3-    Run **'terraform init'** to initialize the working directory.

4-    Run **'terraform plan'** to create an execution plan.

5-    Run **'terraform apply'** to apply the changes to the infrastructure.


## Resources Created

## AWS VPC

-    **'aws_vpc.T_my_vpc_01'**: A VPC with the CIDR block specified in the **'terraform.tfvars'** file.

## Subnets

-    **'aws_subnet.T_private_1'**: A subnet in the first availability zone with the CIDR block specified in the **'terraform.tfvars'** file.
-    **'aws_subnet.T_private_2'**: A subnet in the second availability zone with the CIDR block specified in the **'terraform.tfvars'** file.

## Security Groups

-    **'aws_security_group.T_lb_01'**: A security group for the load balancer that allows ingress traffic from the VPC on port 22 and 8080 and allows egress traffic to any destination.
-    **'aws_security_group_rule.T_lb_ingress_01'**: A security group rule that allows incoming traffic to the load balancer on port 80 from any source.

## Load Balancer

-    **'aws_lb.T_my_alb_01'**: An Application Load Balancer (ALB) that listens on port 80 and is associated with the two subnets and security group created earlier.

## Target Group

-    **'aws_lb_target_group.T_my_tg_01'**: A target group for the instances that listen on port 80 and is associated with the VPC and health check settings.

## EC2 Instance

-    **'aws_instance.T_instance_01'**: An EC2 instance that uses the specified AMI and instance type, is associated with the first subnet, and is created with a specified key pair for ssh access.

## Key Pair

-    **'aws_key_pair.T_ssh_key'**: A key pair to enable ssh access to the EC2 instance.

## Internet Gateway

-    **'aws_internet_gateway.T_my_igw_01'**: An internet gateway associated with the VPC.

## Route Table

-    **'aws_route_table.T_my_route_table_01'**: A route table associated with the VPC that has a route to the internet gateway.

## Variables

-    **'T_vpc_cidr_block'**: The CIDR block for the VPC.
-    **'T_subnet_cidr_block_1'**: The CIDR block for the first subnet.
-    **'T_subnet_cidr_block_2'**: The CIDR block for the second subnet.
-    **'T_avail_zone_1'**: The availability zone for the first subnet.
-    **'T_avail_zone_2'**: The availability zone for the second subnet.
-    **'T_cidr_blocks'**: The CIDR blocks for the security group rule.
-    **'T_my_ip'**: The IP address for the ssh access.
-    **'T_env_prefix'**: The prefix for the names of the resources.
-    **'T_instance_ami'**: The Amazon Machine Image (AMI) for the EC2 instance.
-    **'T_instance_type'**: The instance type for the EC2 instance.
-    **'T_key_name'**: The name of the ssh key pair.
-    **'T_cidr_block'**: The CIDR block for the internet gateway route.
