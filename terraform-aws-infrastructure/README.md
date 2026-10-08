# Terraform AWS Infrastructure

A beginner-friendly AWS Infrastructure as Code (IaC) project using Terraform.

## Architecture

```text
                    Terraform
                        |
                        v
                      AWS VPC
                   10.0.0.0/16
                        |
                        v
                 Public Subnet
                  10.0.1.0/24
                        |
          +-------------+-------------+
          |                           |
          v                           v
 Internet Gateway              Security Group
                                SSH : 22
                                HTTP: 80
                                      |
                                      v
                                 EC2 Instance
                                      |
                                      v
                                  Nginx Web Server
```

## AWS Resources

Terraform creates:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance
- Nginx web server

## Tools Used

- AWS
- Terraform
- EC2
- VPC
- Security Groups
- Nginx
- Git
- GitHub

## Prerequisites

1. AWS account
2. Terraform installed
3. AWS CLI configured, or an IAM role attached to the Terraform machine
4. Existing EC2 key pair
5. Ubuntu AMI ID for the selected AWS region

## How to Run

### 1. Clone the repository

```bash
git clone https://github.com/YOUR-USERNAME/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Create variables file

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`:

```hcl
ami_id   = "YOUR_UBUNTU_AMI_ID"
key_name = "YOUR_EC2_KEY_PAIR_NAME"
```

### 4. Validate

```bash
terraform validate
```

### 5. Format

```bash
terraform fmt
```

### 6. Review the infrastructure

```bash
terraform plan
```

### 7. Create the infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

### 8. Get the website URL

```bash
terraform output website_url
```

Open the displayed URL in a browser.

### 9. Destroy the infrastructure

When the project is no longer needed:

```bash
terraform destroy
```

Type:

```text
yes
```

## Project Flow

```text
Terraform Configuration
        |
        v
terraform init
        |
        v
terraform validate
        |
        v
terraform plan
        |
        v
terraform apply
        |
        v
AWS Infrastructure
        |
        v
EC2 + Nginx Website
```

## Security Note

For a production environment, SSH access should be restricted to a trusted IP address instead of allowing `0.0.0.0/0`.

Never commit:

- AWS access keys
- AWS secret keys
- `.pem` files
- `terraform.tfstate`
- `terraform.tfvars`

## Author

Abinaya

## Project Type

AWS Cloud / DevOps / Infrastructure as Code
