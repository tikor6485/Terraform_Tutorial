# Create aws_iam_group_membership:

resource "aws_iam_group_membership" "team" {
  name = "ft-testing-group-membership"
  users = [
    aws_iam_user.user_01.name,
    aws_iam_user.user_02.name,
  ]
  group = aws_iam_group.group_01.name
}

# Create aws_iam_group
resource "aws_iam_group" "group_01" {
  name = "Tirdad_group_01"
}

# Create aws_iam_user

resource "aws_iam_user" "user_01" {
  name = "Tirdad_user_01"
}
resource "aws_iam_user" "user_02" {
  name = "Tirdad_user_02"
}


# Create aws_iam_access_key:

resource "aws_iam_access_key" "user_01" {
  user = aws_iam_user.user_01.name
}
resource "aws_iam_access_key" "user_02" {
  user = aws_iam_user.user_02.name
}

# Create aws_iam_policy_attachment:

resource "aws_iam_policy_attachment" "attach_01" {
  name = "Tirdad_attachment_01"
  # users      = [aws_iam_user.user_01.name, aws_iam_user.user_02.name]
  roles      = [aws_iam_role.role_01.name]
  groups     = [aws_iam_group.group_01.name]
  policy_arn = aws_iam_policy.policy_01.arn
}


# Create aws_iam_role:

resource "aws_iam_role" "role_01" {
  name = "Tirdad_role_01"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# Create aws_iam_policy:

resource "aws_iam_policy" "policy_01" {
  name        = "Tirdad_policy_01"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
