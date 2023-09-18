resource "aws_iam_instance_profile" "my_profile" {
  name = "my-instance-profile"
  role = aws_iam_role.my_role.name
}