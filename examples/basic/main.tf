terraform {
  required_version = ">= 1.9.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.67.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "private_subnet_basic" {
  source                  = "../../"
  name                    = "private-subnet-basic"
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  has_internet_access     = var.has_internet_access
  ngw_id                  = var.ngw_id
  tags                    = var.tags
}