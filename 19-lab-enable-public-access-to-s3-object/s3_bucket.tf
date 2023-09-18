resource "aws_s3_bucket" "my_bucket" {
  bucket        = "my-s3-bucket-nadir11"
  force_destroy = true
}

output "s3-bucket-name" {
    value = aws_s3_bucket.my_bucket.id
}