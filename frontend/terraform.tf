terraform {
  required_version = "= 0.11.10"

  backend "s3" {
    key    = "frontend/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
