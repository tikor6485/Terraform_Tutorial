# AWS VPC

This Terraform code creates an AWS VPC along with a public subnet and an Internet Gateway.

## Prerequisites

Before running this code, you need to have the following:

-    An AWS account
-    AWS CLI configured on your system
-    Terraform installed on your system

## Usage

1-    Clone this repository and navigate to the project directory.
2-    Open the **'variables.tf'** file and modify the values of the variables to match your environment.
3-    Run **'terraform init'** to initialize the working directory.
4-    Run **'terraform plan'** to preview the changes that Terraform will make in your AWS account.
5-    If the plan looks good, run **'terraform apply'** to create the resources.
6-    When you're done, run **'terraform destroy'** to delete all the resources created by this code.

## Resources Created

This code creates the following resources:

-    An AWS VPC with the specified **'cidr_block'** and **'Name'** tag.
-    A public subnet with the specified **'vpc_id'** , **'cidr_block'** , **'availability_zone'** and **'Name'** tag.
-    An Internet Gateway attached to the VPC with the specified **'vpc_id'** and **'Name'** tag.
-    A default route table for the VPC with a route to the Internet Gateway.


## Variables

The following variables can be configured in the **'variables.tf'** file:

-    **'env_prefix'**: A prefix to use for naming the resources created by this code.
-    **'vpc_cidr_block'**: The CIDR block to use for the VPC.
-    **'subnet_cidr_block'**: The CIDR block to use for the subnet.
-    **'avail_zone'**: The availability zone to use for the subnet.











