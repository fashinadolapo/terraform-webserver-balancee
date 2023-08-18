#create vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = ["var.az1", "var.az2", "var.az3"]
  private_subnets = ["var.priv-sub-1", "var.priv-sub-2", "var.priv-sub-3"]
  public_subnets  = ["var.pub-sub-1", "var.pub-sub-2", "var.pub-sub-3"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Name = "balancee-vpc-${terraform.workspace}"
  }
}

# create key_pairs
module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = var.key_pair
  create_private_key = true
}

# create security groups

module "my_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  Name = "balance-sg-${terraform.workspace}"
  description = "Example security group for SSH, HTTP, and HTTPS"

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "ssh"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "http"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "https"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}

# create ec2 instance 
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "balancee-web-server"

  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = module.my_security_group_id
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Name = "balancee-web-server-${terraform.workspace}"
  }
}

