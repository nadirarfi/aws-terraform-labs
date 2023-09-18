resource "aws_s3_object" "object" {
  for_each     = fileset("images/", "*")
  bucket       = aws_s3_bucket.my_bucket.id
  key          = each.value
  source       = "images/${each.value}"
  etag         = filemd5("images/${each.value}")
  content_type = "image/jpeg"
}