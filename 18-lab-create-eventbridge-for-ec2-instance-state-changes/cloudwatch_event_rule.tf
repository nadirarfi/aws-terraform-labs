resource "aws_cloudwatch_event_rule" "event" {
  name        = "MyEC2StateChangeEvent"
  description = "MyEC2StateChangeEvent"
  event_pattern = <<EOF
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
}
EOF
}