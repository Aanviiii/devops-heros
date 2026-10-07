# Terraform S3 Demo

Creates an S3 bucket with Terraform.

| File | Purpose |
|---|---|
| `terraform.tf` | Terraform + AWS provider versions |
| `provider.tf` | AWS provider and region |
| `variables.tf` | `aws_region`, `bucket_name` |
| `terraform.tfvars` | Values for the variables |
| `main.tf` | `aws_s3_bucket` resource |
| `outputs.tf` | Bucket name, ARN, region |
| `localstack_override.tf` | Local testing against LocalStack (delete it to use real AWS) |

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform show
terraform output
terraform destroy
```
