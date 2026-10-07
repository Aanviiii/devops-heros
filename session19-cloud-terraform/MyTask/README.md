# Cloud & Terraform in Action

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

Project: [terraform-project](terraform-project/)

* No AWS account, so the infrastructure is created on LocalStack (local AWS emulator) using `localstack_override.tf`.

## Architecture

```mermaid
flowchart TD
    TF[Terraform] --> VPC["VPC 10.20.0.0/16"]
    TF --> S3[S3 bucket + versioning]
    VPC --> IGW[Internet Gateway]
    VPC --> SUB["Public Subnet 10.20.1.0/24"]
    VPC --> SG["Security Group 80, 443"]
    IGW --> RT["Route Table 0.0.0.0/0"]
    RT --> SUB
    SUB --> EC2[EC2 t3.micro]
    SG --> EC2
```

| Concept | Where |
|---|---|
| Provider | `versions.tf`, `localstack_override.tf` |
| Variables | `variables.tf`, `terraform.tfvars` |
| Resources | `main.tf`, `ec2.tf`, `s3.tf` |
| Outputs | `outputs.tf` |
| Dependencies | EC2 → Subnet/SG → VPC (from `terraform graph`) |
| State | `terraform state list` |

## init, fmt, validate

![init](image-1.png)

## terraform plan

![plan](image-2.png)

## terraform apply

![apply](image-3.png)

## AWS resources created

![resources](image-4.png)

## State, outputs, dependencies

![state](image-5.png)

## terraform destroy

![destroy](image-6.png)

## Plan against real AWS (no credentials)

![aws-credentials](image-7.png)
