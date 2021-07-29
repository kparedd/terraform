resource "aws_instance" "sample" {
  ami                       = "ami-074df373d6bafa625"
  instance_type             = "var.TYPE"
  vpc_security_group_ids    = [var.SG_ID]

  tags                      = {
    Name                    = "sample"
  }
}

variable "SG_ID" {}
variable "TYPE" {}

output "PRIVATE_IP" {
  value = aws_instance.sample.private_ip

}