# Configure the AWS Provider with Mock Credentials for Lab Testing
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

# Provision a basic virtual network (VPC)
resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "DevOps-Lab-VPC"
  }
}