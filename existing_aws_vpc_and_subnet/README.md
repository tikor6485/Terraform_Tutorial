# Terraform AWS Existing VPC and Subnet

This Terraform configuration creates two subnets, one in a new VPC and one in an existing VPC.


## Prerequisites

Before running the Terraform scripts, the following must be set up:

-   AWS account credentials with permissions to create VPCs and subnets.


## Usage

1-    Install Terraform.
2-    Clone the repository and navigate to the directory where the **'.tf'** files are located.
3-    Run **'terraform init'** to initialize a working directory containing Terraform configuration files.
5-    Run **'terraform plan'**  to preview the changes that will be applied to the infrastructure.
6-    Run **'terraform apply'** to create the VPC and subnets.

## Resources Created

## aws_vpc

This resource creates a new VPC with the specified **'cidr_block'** and **'tags'**.

## aws_subnet

This resource creates two subnets, **'dev-subnet-01'** and **'dev-subnet-exist-01'**.

**'dev-subnet-01'** is associated with the new VPC (**'aws_vpc.development-vpc'**), with a specified **'cidr_block'** and **'tags'**.

**'dev-subnet-exist-01'** is associated with an existing VPC (**'data.aws_vpc.existing_vpc'**) and has a specified **'cidr_block'** and **'tags'**.

## data.aws_vpc

This data source fetches the default VPC information, which is used to create **'dev-subnet-exist-01'**.

## Inputs

**'cidr_block'** (optional): Specifies the IP range for the VPC. Default is "10.0.0.0/16".
