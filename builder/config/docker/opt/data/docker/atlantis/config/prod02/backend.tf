terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-789789789789-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-789789789789-ap-southeast-3"
    key            = "devopscorner/789789789789/atlantis/tfstate"
    encrypt        = true
  }
}
