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