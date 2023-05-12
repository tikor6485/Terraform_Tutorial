# Terraform AWS VPC and EC2 Instance Deployment

This repository contains the Terraform configuration files for deploying an Amazon Web Services (AWS) Virtual Private Cloud (VPC) with an EC2 instance inside.


## Prerequisites

Before running the Terraform scripts, the following must be set up:

-   An AWS account with the necessary permissions to create and manage VPCs and EC2 instances
-   Terraform installed on your local machine
-   SSH key pair generated 


## Usage

1-    Clone this repository to your local machine.
2-    Change into the project directory.
3-    Update the **'variables.tf'** file with your own values for the following variables:
-    **'env_prefix'**: Prefix to be added to all resource names.
-    **'vpc_cidr_block'**: CIDR block for the VPC.
-    **'subet_cidr_block'**: CIDR block for the subnet.
-    **'avail_zone'**: Availability zone for the EC2 instance.
-    **'ami_id'**: ID of the Amazon Machine Image (AMI) to be used for the EC2 instance.
-    **'instance_type'**: Instance type for the EC2 instance.
-    **'my_ip'**: Your IP address to allow SSH access.
-    **'public_key_location'**: The location of your public key file.
-    
4-    Run **'terraform init'** to initialize the working directory.

5-    Run **'terraform plan'**  to create an execution plan.

6-    If the execution plan looks good, run **'terraform apply'** to apply the changes and create the VPC and EC2 instance.

7- Once the EC2 instance is created, you should be able to SSH into it using the private key associated with your SSH key pair. The public IP address of the instance can be found in the Terraform output.


## Resources Created

This Terraform configuration creates the following AWS resources:

-    VPC
-    Subnet
-    Internet Gateway
-    Default Route Table
-    Default Security Group
-    EC2 Instance

