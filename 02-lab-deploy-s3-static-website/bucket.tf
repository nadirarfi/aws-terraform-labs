resource "aws_s3_bucket" "website" {
  bucket        = "my-static-website-nadir11"
  force_destroy = true

  tags = {
    Name        = "Nadir Bucket"
    Environment = "Dev"
  }
}
