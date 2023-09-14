resource "aws_s3_bucket" "my_bucket" {
  bucket        = "myyy-testing-bucket-nadir11"
  force_destroy = true


}

output "s3-bucket-name" {
  value = aws_s3_bucket.my_bucket.id
}