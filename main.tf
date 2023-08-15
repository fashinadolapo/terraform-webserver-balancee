#create vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Name = "balancee-vpc-${terraform.workspace}"
  }
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

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = module.my_security_group_id
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Name = "balancee-web-server-${terraform.workspace}"
  }
}

