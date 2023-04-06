# Terraform-Tutorial on AWS

This repository contains Terraform code for provisioning and managing infrastructure on AWS. The code is organized into modules for various resources and services, making it easy to customize and reuse for your own projects.

## Getting Started

To get started with this Terraform code, you'll need to do the following:

1. Clone this repository to your local machine.
2. Configure your AWS credentials in `~/.aws/credentials`.
3. Modify the `variables.tf` file to customize the Terraform code for your needs.
4. Run `terraform init` to initialize the Terraform modules.
5. Run `terraform plan` to see a preview of the changes Terraform will make.
6. Run `terraform apply` to apply the changes and provision your infrastructure.

## Terraform Modules

The following Terraform modules are included in this repository:

- `vpc`: Creates a VPC with public and private subnets, NAT gateways, and security groups.
- `ec2`: Creates an EC2 instance in the specified VPC and subnet.
- `iam`: Creates an IAM user with access keys and permissions for AWS resources.
- `s3`: Creates an S3 bucket with the specified bucket name and access controls.
- `route53`: Creates a Route 53 hosted zone and DNS records.

## Contributing

Contributions are welcome! If you find a bug or want to add a new Terraform module, please open an issue or pull request.

Feel free to fork and modify this Terraform code to suit your needs.
