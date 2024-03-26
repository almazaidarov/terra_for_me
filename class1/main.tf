resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "bitch_iam_an_engineer"
    managed_by = "https://github.com/almazaidarov/terra_for_me"
  }
}

resource "aws_iam_user" "lb" {
  name = "iam_an_engineer"
  path = "/system/"

  tags = {
    Name = "bitch_iam_an_engineer"
    managed_by = "https://github.com/almazaidarov/terra_for_me"
  }
}

resource "aws_iam_group" "engineers" {
  name = "engineers"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
  ]

  group = aws_iam_group.engineers.name
}

resource "aws_key_pair" "terraform_class1" {
  key_name   = "terraform_class1"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_key_pair" "terraform_class2" {
  key_name   = "terraform_class2"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket_prefix  = "engineers"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}