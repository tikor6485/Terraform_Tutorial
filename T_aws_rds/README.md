# AWS VPC with a specified subnet group and security group

This Terraform script creates a MySQL RDS instance in an AWS VPC with a specified subnet group and security group. It also creates a new VPC, two subnets, an EC2 instance for testing, and an SSH key pair.

## Prerequisites


-    An AWS account with sufficient privileges to create resources.
-    AWS CLI installed and configured.
-    Terraform installed and configured.

## Usage

To use this code, follow these steps:

1-    Clone this repository.
2-    Navigate to the directory containing the **'main.tf'** file.
3-    Run **'terraform init'** to initialize the working directory..
4-    Run **'terraform apply'** to create the resources. You will be prompted to confirm the creation of resources.
5-    Once the resources are created, you can find the RDS instance endpoint in the AWS console. Use this endpoint to connect to the MySQL instance using your favorite MySQL client.
6-    Run **'terraform destroy'** to destroy all created resources when you no longer need them.

## Resources Created

-    AWS VPC.
-    Two subnets in different availability zones.
-    Security group for the RDS instance.
-    Subnet group for the RDS instance.
-    Parameter group to configure database engine parameters.
-    RDS instance.
-    EC2 instance for testing.
-    SSH key pair.


## Variables

The following variables are defined in the **'variables.tf'** file and can be customized to suit your needs:

-    **'T_env_prefix'**: A prefix to identify your environment.
-    **'T_my_ip'**: The IP of the machine you want to connect from.
-    **'T_vpc_cidr_block'**: The CIDR block for the VPC.
-    **'T_subnet_cidr_block_1'**: The CIDR block for the first subnet.
-    **'T_subnet_cidr_block_2'**: The CIDR block for the second subnet.
-    **'T_avail_zone_1'**: The availability zone for the first subnet.
-    **'T_avail_zone_2'**: The availability zone for the second subnet.
-    **'T_instance_ami'**: The AMI ID of the EC2 instance.
-    **'T_instance_type'**: The instance type for the EC2 instance.
-    **'T_instance_name'**: The name of the EC2 instance.
-    **'T_key_name'**: The path to your SSH public key.











