# AWS IAM Resources

This repository contains the Terraform code to create various AWS IAM resources including a group, users, roles, access keys, policy attachment, and policies.

## Prerequisites

Before you begin, make sure you have:

-    An AWS account with appropriate permissions
-    Terraform installed

## Usage

To use this code, follow these steps:

1-    Clone this repository.
2-   Initialize the Terraform working directory and download the necessary plugins by running the command **'terraform init'**.
3-    Customize the variables in **'variables.tf'** file according to your needs.
4-    Run the command **'terraform apply'** to create the resources.

## Resources

This Terraform code creates the following AWS IAM resources:

-    **'aws_iam_group_membership'**: Creates a group membership for users.
-    **'aws_iam_group'**: Creates an IAM group.
-    **'aws_iam_user'**: Creates an IAM user.
-    **'aws_iam_access_key'**: Creates an access key for an IAM user.
-    **'aws_iam_policy_attachment'**: Attaches a policy to a user, group, or role.
-    **'aws_iam_role'**: Creates an IAM role.
-    **'aws_iam_policy'**: Creates an IAM policy.
