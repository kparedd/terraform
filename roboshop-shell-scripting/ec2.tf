resource "aws_spot_instance_request" "cheap_worker"  {
  count                   = length(var.COMPONENTS)
  ami                     = "ami-074df373d6bafa625"
  spot_price              = "0.0031"
  instance_type           = "t3.micro"
  wait_for_fulfillment    = true

  tags                    = {
    Name                  = element(var.COMPONENTS, count.index)
  }
}
  resource "aws_ec2_tag" "name-tag" {
    count                 = length(var.COMPONENTS)
    resource_id           = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
    key                   = "Name"
    value                 = element(var.COMPONENTS, count.index)
  }

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket            = "terraform-kp58"
    key               = "roboshop/shell-scripting/terraform.tfstate"
    region            = "us-east-1"
    dynamodb_table    = "terraform"
  }
}