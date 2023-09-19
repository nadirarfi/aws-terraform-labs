output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web-server.id
}


output "event_name" {
  description = "ARN of CloudWatch Rule"
  value       = aws_cloudwatch_event_rule.event.arn
}	

output "sns_policy" {
  description = "SNS Policy"
  value       = data.aws_iam_policy_document.topic_policy.json
}

output "topic_arn1" {
  value       = aws_sns_topic.my_topic.arn
  description = "Topic created successfully"
}
