variable "account_id" {
  description = "Account ID"
  type        = string
}

variable "region" {
  description = "Name of the region"
  type        = string
}

variable "sns_subscription_email" {
  type        = string
  description = "Email endpoint for the SNS subscription"
}

variable "topic_name" {
  description = "Topic name"
  default     = "my-topic"
}
