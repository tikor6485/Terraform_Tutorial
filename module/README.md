# Module

This Terraform module creates an AWS VPC, subnet, and EC2 instance for an application.


## Prerequisites

-    Terraform version >= 0.12
-    AWS provider plugin >= 2.0


## Usage

This module can be used by defining the following variables:

-    **'vpc_cidr_block'**: The CIDR block for the VPC.
-    **'subet_cidr_block'**: The CIDR block for the subnet.
-    **'avail_zone'**: The availability zone for the subnet and EC2 instance.
-    **'env_prefix'**: The prefix to use for naming resources.
-    **'my_ip'**: The IP address from which to access the EC2 instance.
-    **'image_name'**: The name of the AMI to use for the EC2 instance.
-    **'public_key_location'**: The path to the public key file to use for SSH access to the EC2 instance.
-    **'instance_type'**: The instance type to use for the EC2 instance.

## Resources Created

This module creates the following resources:

-    An AWS VPC with the given CIDR block and tags.
-    An AWS subnet within the VPC with the given CIDR block, availability zone, and tags.
-    An EC2 instance within the subnet with the given instance type, image name, and public key.
