terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-888899990000-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-888899990000-ap-southeast-3"
    key            = "devopscorner/888899990000/atlantis/tfstate"
    encrypt        = true
  }
}
