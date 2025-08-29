terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  backend s3 {
    bucket = "my-tf-remote-state-bucket"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "my-tf-remote-state-dynamodb-table"
    use_lockfile = true
  }

}

provider "aws" {
  region = var.aws_region
}