# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

terraform {
  backend "s3" {
    bucket         = "test-bucket-for-terraform-keyur"
    key            = "example/terraform.tfstate"
    region         = "us-east-1"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-3d825447"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
