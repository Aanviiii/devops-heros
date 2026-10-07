variable "aws_region" {
  description = "AWS region for the Session 19 mini project."
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI used for the web server."
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket for application assets."
  type        = string
}
