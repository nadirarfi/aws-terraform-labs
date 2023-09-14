
resource "aws_sns_topic_subscription" "sub" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = var.sns_subscription_email
}

output "subscription_arn1" {
  value       = aws_sns_topic_subscription.sub.arn
  description = "Subscription created successfully. Confirm the subscription on your mail"
}