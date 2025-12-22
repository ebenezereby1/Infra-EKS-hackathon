terraform {
  backend "s3" {
    bucket         = "devops-hackathon-123456789012-ap-south-1-tf-state"
    key            = "eks/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
