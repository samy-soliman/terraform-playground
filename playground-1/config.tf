terraform {
  backend "s3" {
    bucket         = "terraform-iti"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    profile = "terraform"
    encrypt        = true
    dynamodb_table = "terraform"
  }
}
