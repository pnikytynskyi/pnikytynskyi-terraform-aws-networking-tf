module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "13-local-module"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-central-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      # Public subnets are indicated by setting the "public" optionю By default false
      public = true
      az     = "eu-central-1b"
    }
  }
}
