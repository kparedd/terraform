resource "aws_instance" "sample" {
  ami                       = "ami-074df373d6bafa625"
  instance_type             = "t3.micro"
  vpc_security_group_ids    = [var.SG_ID]
  tags                      = {
    Name                    = "sample"
  }
}

variable "SG_ID" {}