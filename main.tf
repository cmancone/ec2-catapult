terraform {
  backend "s3" {
    bucket = "always-upgrade-terraform-state"
    key = "ec2-catapult.json"
    region = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "test_instance" {
  source = "./ec2_instance"
  ami = data.aws_ami.ubuntu.id
  subnet_id = module.vpc.public_subnets[0]
  vpc_id = module.vpc.vpc_id
  name = "test-instance"
}
