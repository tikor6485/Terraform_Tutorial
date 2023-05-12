# AWS Infrastructure with Terraform

This Terraform script provisions a VPC, a subnet, an internet gateway, a route table, and a security group in AWS.


## Prerequisites

-    AWS Account and AWS CLI installed
-    Terraform installed


## Usage

1-    Clone this repository.
2-    Navigate to the directory containing the code.
3-    Configure the AWS provider in **'variables.tf'** by providing your AWS access key and secret access key.
4-    Update the variables in **'variables.tf'** to suit your needs.
5-    Run **'terraform init'** to initialize the working directory.
6-    Run **'terraform plan'** to create an execution plan.
7-    Run **'terraform apply'** to apply the changes.


## Resources Created

-    **'aws_vpc'**: A VPC with the CIDR block specified in the **'vpc_cidr_block'** variable.
-    **'aws_subnet'**: A subnet within the VPC created above, with the CIDR block specified in the **'subnet_cidr_block'** variable.
-    **'aws_internet_gateway'**: An internet gateway for the VPC.
-    **'aws_default_route_table'**: A default route table for the VPC created above, with a route to the internet gateway created above.
-    **'aws_security_group'**: A security group for the VPC created above, allowing inbound traffic from the IP address specified in the **'my_ip'** variable on port 22 (SSH) and port 8080 (HTTP), and allowing all outbound traffic.


## Inputs

-    **'vpc_cidr_block'**: The CIDR block for the VPC.
-    **'subnet_cidr_block'**: The CIDR block for the subnet.
-    **'avail_zone'**: The availability zone for the subnet.
-    **'my_ip'**: The IP address that is allowed to access the EC2 instances via SSH.

## Outputs

-    **'vpc_id'**: The ID of the VPC.
-    **'subnet_id'**: The ID of the subnet.
-    **'sg_id'**: The ID of the security group.

