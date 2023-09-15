resource "aws_sqs_queue" "standard" {
  name                      = "nadir-standard-queue"
  visibility_timeout_seconds = 50
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

output "std" {
    value = aws_sqs_queue.standard.arn
}