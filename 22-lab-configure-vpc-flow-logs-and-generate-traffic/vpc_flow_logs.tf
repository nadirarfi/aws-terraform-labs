resource "aws_flow_log" "logs" {
  iam_role_arn    = "${aws_iam_role.vpc_flow_logs_role.arn}"
  log_destination = "${aws_cloudwatch_log_group.vpc_flow_logs_group.arn}"
  traffic_type    = "ALL"
  vpc_id          = "${aws_vpc.my_vpc.id}"
}