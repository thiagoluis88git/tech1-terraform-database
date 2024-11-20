variable "networking" {
  type = object({
    cidr_block      = string
    region          = string
    profile         = string
    vpc_name        = string
    fiap_role       = string
    azs             = list(string)
    public_subnets  = list(string)
    private_subnets = list(string)
    nat_gateways    = bool
  })
  default = {
    cidr_block      = "10.0.0.0/16"
    region          = "us-east-1"
    profile         = "fiap-local"
    vpc_name        = "fiap-vpc"
    fiap_role       = "arn:aws:iam::533267412722:role/LabRole"
    azs             = ["us-east-1a", "us-east-1b"]
    public_subnets  = ["10.0.64.0/24", "10.0.96.0/24"]
    private_subnets = ["10.0.0.0/24", "10.0.32.0/24"]
    nat_gateways    = true
  }
}

variable "rds_config" {
    type = object({
      name              = string
      instance_class    = string
      allocated_storage = number
      port              = number
      username          = string
      engine            = string
      engine_version    = string
    })
    default = {
      name              = "fastfood-database"
      instance_class    = "db.t3.micro"
      allocated_storage = 5
      port              = 5432
      username          = "fastfood_db_user"
      engine            = "postgres"
      engine_version    = "14.13"
    }
}

variable "db_password" {
  description = "RDS root user password"
  type        = string
  sensitive   = true
}
