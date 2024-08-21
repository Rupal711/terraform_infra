terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60.0"
    }
  }
}

#Connect with aws account using secret_key and access_id 
provider "aws" {
  region     = var.region

}

# Genrate Aws key pair 
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair1"
  public_key="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExIrF9Fw7TDm8juA8NUEMBbST1pPn6oF/h8KzHeUGAx root@ip-10-0-3-107" # Name for your key pai
}
