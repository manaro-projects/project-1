# Manara Project 1

This Terraform project provisions a basic AWS infrastructure that includes:

- A VPC with a public subnet
- An Internet Gateway and routing for public internet access
- A security group that allows HTTP (port 80) traffic
- An EC2 instance running a Docker container from Docker Hub

## Table of Contents

- [Architecture](#architecture)
- [Resources Created](#resources-created)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Input Variables](#input-variables)


## Architecture

```
┌────────────────────────────┐
│ AWS Region                 │
│                            │
│ ┌──────────────────────┐   │
│ │ VPC                  │   │
│ │                      │   │
│ │ ┌────────────────┐   │   │
│ │ │ Public Subnet  │   │   │
│ │ │                │   │   │
│ │ │ EC2 Instance   │   │   │
│ │ └────────────────┘   │   │
│ └──────────────────────┘   │
└────────────────────────────┘
```

## Resources Created

- **VPC** with DNS hostnames enabled
- **Internet Gateway** attached to the VPC
- **Public Subnet** mapped to an Availability Zone
- **Route Table** and association for internet access
- **Security Group** allowing HTTP inbound and all outbound traffic
- **Amazon Linux 2023 EC2 Instance**
  - Installs Docker
  - Runs a container from Docker Hub

## Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- An AWS account with appropriate IAM permissions
- AWS CLI configured with credentials (`aws configure`)

## Usage

1. **Clone the repo:**

```bash
git clone <your-repo-url>
cd <your-repo-directory>
```

2. **Initialize Terraform:**
```bash
terraform init
```

3. **Set your variables:**

Create a `terraform.tfvars` file or set them via CLI:

```hcl
region         = "us-east-1"
vpc_cidr       = "10.0.0.0/16"
instance_type  = "t2.micro"
docker_user    = "your-dockerhub-username"
docker_pass    = "your-dockerhub-password"
docker_image   = "your-dockerhub-image"
```
4. **Apply the configuration:**

```bash
terraform apply
```

5. **Access the EC2 instance:**

After applying, Terraform will show the public IP address (if output is defined). You can access your app via `http://<ec2-public-ip>`.

## Input Variables

| Name	| Description	| Type	| Required |
|-------|-------------|-------|----------|
| region	| AWS region | string	| yes |
| vpc_cidr	| CIDR block for the VPC	| string	| yes |
| instance_type	| EC2 instance type	| string	| yes |
| docker_user	| Docker Hub username	| string	| yes |
| docker_pass	| Docker Hub password	| string	| yes |
| docker_image	| Docker image to run on the EC2 instance	| string	| yes |

**Security Note:** Never commit `docker_pass` or secrets to version control. Use environment variables or a secure secrets manager.
