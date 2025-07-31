provider "aws" {
    region = "us-east-1"
}


resource "aws_instance" "lab"{
    ami = "ami-0c94855ba95c71c99"
    instance_type = "t2.micro"
    count = var.core_count
    

    tags = {
      Name = "mylab10"
    }
}

terraform {
  backend "s3" {
    bucket = "condormatics-s25-tfstate-dp"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
