terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-098765432101-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-098765432101-ap-southeast-3"
    key            = "devopscorner/098765432101/atlantis/tfstate"
    encrypt        = true
  }
}
