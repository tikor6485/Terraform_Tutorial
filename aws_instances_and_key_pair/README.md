# Terraform AWS Instance and Key Pair

This Terraform configuration file creates an SSH key pair that is used to connect to the instance.


## Prerequisites

Before using this Terraform file, make sure you have the following prerequisites:

-    An AWS account with the required permissions to create EC2 instances and key pairs
-    A valid AMI ID and instance type for the EC2 instance
-    An SSH public key file to be used for the key pair


## Usage

1-    Update the **'variables.tf'** file with your desired values for the following variables:
-    **'ami_id'**: The ID of the AMI you want to use for the instance
-    **'instance_type'**: The instance type for the EC2 instance
-    **'machine_name'**: A descriptive name for the EC2 instance
-    **'key_name'**: The filename of the SSH public key to be used for the key pair

2-    Run **'terraform init'** to initialize the Terraform environment.

3-    Run **'terraform plan'** to preview the changes that will be made.

4-    Run **'terraform apply'** to create the resources.

5-    Connect to the instance using the generated SSH key pair.



## Resources Created
This Terraform file creates the following AWS resources:

-    **'aws_instance'**: An EC2 instance with the specified AMI ID, instance type, and SSH key pair.
-    **'aws_key_pair'**: An SSH key pair that is used to connect to the EC2 instance.


## Prerequisites

This Terraform file creates the following AWS resources:

-    [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
-    [AWS EC2 Instance Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
-    [AWS Key Pair Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

