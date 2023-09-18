resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_object" "objects" {
  for_each     = fileset("html/", "*")
  bucket       = aws_s3_bucket.my_bucket.id
  key          = each.value
  source       = "html/${each.value}"
  etag         = filemd5("html/${each.value}")
  content_type = "text/html"

}

