resource "aws_sqs_queue" "fifo" {
  name                        = "nadir-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
  visibility_timeout_seconds = 50
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10  
}

output "fifo" {
    value = aws_sqs_queue.fifo.arn
}