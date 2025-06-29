terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-23123123123-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-23123123123-ap-southeast-3"
    key            = "devopscorner/23123123123/atlantis/tfstate"
    encrypt        = true
  }
}
