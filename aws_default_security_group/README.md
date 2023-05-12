# AWS Infrastructure

This Terraform code creates a new Virtual Private Cloud (VPC) and associated resources in AWS, including a subnet, an internet gateway, a default route table, and a default security group.


## Prerequisites

Before running this code, you need to have the following:

-    Terraform installed on your machine.
-    AWS access credentials.

## Resources Created

-    **'aws_vpc'**: Creates a new VPC in your AWS account.
-    **'aws_subnet'**: Creates a subnet within the VPC.
-    **'aws_internet_gateway'**: Creates an internet gateway, which allows traffic to flow in and out of the VPC.
-    **'aws_default_route_table'**: Creates a default route table for the VPC.
-    **'aws_default_security_group'**: Creates a default security group for the VPC.


## How to use

1-    Clone this repository onto your machine.

2-    Add your AWS access credentials as environment variables or update the **'provider'** block in the **'main.tf'** file.

3-    Customize the values in the **'variables.tf'** file to fit your use case.

3-    Run **'terraform init'** to initialize your working directory.

4-    Run **'terraform plan'** to see what changes will be made.

5-    If the plan looks good, run **'terraform apply'** to create the resources in your AWS account.

6-    When you are done, run **'terraform destroy'** to remove all the resources.


Note: Make sure you do not have any critical data in the VPC as it will be destroyed if you run **'terraform destroy'**.
