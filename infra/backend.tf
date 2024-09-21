terraform {
  backend "s3" {
    bucket = "ratl-fiaptech1-2024-terraform-state"
    key    = "fiap/tech-challenge-database"
    region = "us-east-1"
  }
}