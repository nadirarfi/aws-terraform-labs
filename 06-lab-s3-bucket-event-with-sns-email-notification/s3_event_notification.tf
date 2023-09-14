resource "aws_s3_bucket_notification" "event_notification" {
  bucket = aws_s3_bucket.my_bucket.id
  topic {
    topic_arn = aws_sns_topic.my_topic.arn
    events    = ["s3:ObjectCreated:*"]
  }
}