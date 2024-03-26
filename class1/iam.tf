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

resource "aws_iam_policy" "policy" {
  name        = "admin_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
  )
}