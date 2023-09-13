variable "sns_subscription_email" {
  type = string
  description = "Email endpoint for the SNS subscription"
}

resource "aws_sns_topic_subscription" "sub" {
  endpoint = var.sns_subscription_email
  protocol = "email"
  topic_arn =  aws_sns_topic.my_topic.arn
  #subscription_role_arn = 
}

output "subscription_arn1" {
    value = aws_sns_topic_subscription.sub.arn
    description = "Subscription created successfully. Confirm the subscription on your mail"
}