terraform {
  backend "s3" {
    bucket = "sctp-ce6-tfstate"
    key = "aldindc-ec2.tfstate" #Remember to change this
    region = "ap-southeast-1" #Region of your backend bucket
  }
}