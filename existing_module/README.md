# Existing Module

This Terraform configuration creates an AWS VPC with a public subnet and deploys a web server instance in the subnet.


## Prerequisites

Before running this Terraform configuration, ensure that you have the following:

-    An AWS account
-    AWS CLI configured with your account credentials
-    Terraform installed on your local machine


## Usage

To use this Terraform configuration:

1-    Clone the repository to your local machine

2-    Navigate to the root directory of the cloned repository

3-    Edit the **'terraform.tfvars'** file and provide values for the required variables

5-    Run the following commands:
-    **'terraform init'**
-    **'terraform plan'**
-    **'terraform apply'**

6- To destroy the resources created by Terraform, run the following command:
-    **'terraform destroy'**


## Variables

This Terraform configuration uses the following variables:

-    **'vpc_cidr_block'**: The CIDR block for the VPC to be created
-    **'avail_zone'**: The availability zone for the VPC
-    **'subet_cidr_block'**: The CIDR block for the public subnet to be created
-    **'my_ip'**: The IP address from which you want to access the web server instance
-    **'env_prefix'**: A prefix to be used for naming resources
-    **'image_name'**: The name of the AMI to be used for the web server instance
-    **'public_key_location'**: The path to the public key file to be used for SSH access to the web server instance
-    **'instance_type'**: The instance type for the web server instance

## Modules

This Terraform configuration uses the following modules:

-    **'terraform-aws-modules/vpc/aws'**: This module is used to create the VPC, subnets, and other VPC-related resources.
-    **'modules/webserver'**: This module is used to deploy the web server instance in the public subnet created by the **'terraform-aws-modules/vpc/aws'** module.


## Outputs

This Terraform configuration provides the following outputs:

-    **'vpc_id'**: The ID of the VPC created by the **'terraform-aws-modules/vpc/aws'**module.
-    **'public_subnet_id'**:  The ID of the public subnet created by the **'terraform-aws-modules/vpc/aws'** module.
-    **'web_server_public_ip'**: The public IP address of the web server instance created by the **'modules/webserver'** module.




