#  AWS VPC, Subnet and Routing

This Terraform configuration creates an Amazon Web Services (AWS) Virtual Private Cloud (VPC) with a subnet, route table, internet gateway, and association between the subnet and the route table.


## Prerequisites

-    AWS account and credentials
-    Terraform installed on your local machine


## Usage

1-    Clone the repository to your local machine.
2-    Navigate to the directory containing the **'main.tf'** file.
3-    Create a **'terraform.tfvars'** file in the same directory and set the variables as per your requirement.
4-    Run **'terraform init'** command to initialize the modules.
5-    Run **'terraform apply'** command to create the VPC, subnet, and routing resources.
6-    When you're done, run **'terraform destroy'** to delete the resources.



## Variables

-    **'vpc_cidr_block'**: - The CIDR block for the VPC. Defaults to **'10.0.0.0/16'**.
-    **'subet_cidr_block'**: - The CIDR block for the subnet. Defaults to **'10.0.1.0/24'**.
-    **'avail_zone'**: - The availability zone to deploy the infrastructure. Defaults to **'us-west-2a'**.



