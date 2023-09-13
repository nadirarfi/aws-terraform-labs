resource "aws_sns_topic" "my_topic" {
  name = "my-topic"
}

output "topic_arn1" {
    value = aws_sns_topic.my_topic.arn
    description = "Topic created successfully"
}