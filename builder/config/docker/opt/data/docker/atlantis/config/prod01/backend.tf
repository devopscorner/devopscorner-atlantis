terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-456456456456-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-456456456456-ap-southeast-3"
    key            = "devopscorner/456456456456/atlantis/tfstate"
    encrypt        = true
  }
}
