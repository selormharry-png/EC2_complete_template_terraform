# EC2 Web Server Infrastructure

Terraform configuration for deploying a basic Apache web server on Amazon EC2 in AWS.

## What It Creates

- A VPC with DNS support and DNS hostnames enabled.
- Two subnets. The EC2 instance uses the public subnet, which assigns public IPv4 addresses at launch.
- An internet gateway, a route table with a default route to the gateway, and an association between that route table and the public subnet.
- A security group allowing inbound SSH (22), HTTP (80), and HTTPS (443), plus all outbound traffic.
- An Amazon Linux 2 x86_64 EC2 instance. Its user data installs and starts Apache and writes a simple project page to the web root.

The second subnet is created but is not associated with the public route table or used by the EC2 instance.

## Prerequisites

- Terraform installed.
- AWS CLI credentials configured for the profile selected by `aws_profile` (defaults to `Kloud_Messiah`), or set `aws_profile` to a profile available on your machine.
- An EC2 key pair named by `key_name` (defaults to `terra_tut_key`) already created in the selected AWS region.

The AWS identity needs permission to create and manage the VPC, networking, security group, and EC2 resources in the selected region.

## Deploy

Run these commands from this directory:

```sh
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

Terraform uses the defaults listed below. Override them by passing `-var="name=value"` to `plan` and `apply`, or by supplying a `.tfvars` file. For example, to choose a different AWS profile:

```sh
terraform apply -var="aws_profile=my-aws-profile"
```

After deployment, Terraform prints the instance's public IP, instance ID, and public DNS name. Visit `http://<ec2_public_ip>` to load the Apache page. HTTPS access is allowed by the security group, but this configuration does not install or configure TLS.

To remove the resources:

```sh
terraform destroy
```

## Inputs

| Variable | Default | Purpose |
| --- | --- | --- |
| `aws_region` | `eu-central-1` | AWS region for the deployment. |
| `aws_profile` | `Kloud_Messiah` | Local AWS CLI profile used by the AWS provider. |
| `vpc_cidr` | `10.0.0.0/16` | VPC CIDR block. |
| `vpc_name` | `main` | VPC `Name` tag. |
| `aws_internet_gateway` | `main-igw` | Internet gateway `Name` tag. |
| `subnet_cidr` | `10.0.1.0/24` | CIDR block for the additional subnet. |
| `public_subnet_cidr` | `10.0.2.0/24` | CIDR block for the public subnet used by the instance. |
| `route_table_name` | `0.0.0.0/0` | Destination CIDR for the route through the internet gateway. |
| `aws_security_group_name` | `main-sg` | Security group name. |
| `instance_type` | `t3.micro` | EC2 instance type. |
| `key_name` | `terra_tut_key` | Existing EC2 key pair name in the selected region. |
| `owner` | `Selorm` | Owner name rendered on the web page. |
| `owner_email` | `selormharry@gmail.com` | Owner email rendered on the web page. |

The AMI is selected automatically as the most recent Amazon-owned Amazon Linux 2 x86_64 HVM image matching the configuration.

## Security and State

SSH, HTTP, and HTTPS ingress are currently allowed from `0.0.0.0/0`. Restrict these CIDR ranges to trusted IP addresses before using this configuration in a production environment. The instance has no HTTPS/TLS configuration despite port 443 being open.

Terraform state files (`terraform.tfstate` and its backup) contain infrastructure metadata and may include sensitive values. Keep them private and do not commit them. The `.gitignore` excludes dotfiles and Terraform state-related files.
