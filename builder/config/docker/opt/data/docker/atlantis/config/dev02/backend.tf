terraform {
  backend "s3" {
    region         = "ap-southeast-3"
    bucket         = "tf-state-555566667777-ap-southeast-3"
    dynamodb_table = "ddb-tf-state-555566667777-ap-southeast-3"
    key            = "devopscorner/555566667777/atlantis/tfstate"
    encrypt        = true
  }
}
