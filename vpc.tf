module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = var.name
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  private_subnets      = []
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24", "10.0.104.0/24"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_nat_gateway   = false
}
