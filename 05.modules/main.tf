module "sg" {
  source = "./sg"
}

module "ec2" {
  depends_on = [module.sg]
  source = "./ec2"
  SG_ID  = module.sg.SG_ID
  TYPE = "t3.small"
}
output "PRIVATE_IP" {
  value = module.ec2.PRIVATE_IP
}

provider "aws" {
  region = "us-east-1"
}