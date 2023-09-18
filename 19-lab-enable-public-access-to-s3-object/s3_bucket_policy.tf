data "aws_iam_policy_document" "bucket_policy" {

  statement {
    effect  = "Allow"
    actions = ["s3:ListBucket*", "s3:GetObject"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_s3_bucket.my_bucket.arn}",
      "${aws_s3_bucket.my_bucket.arn}/*"
    ]


  }
}

resource "aws_s3_bucket_policy" "read_access_policy" {
    bucket = aws_s3_bucket.my_bucket.id
    policy = data.aws_iam_policy_document.bucket_policy.json
}

output "bucket_policy" {
  description = "Bucket Policy"
  value = data.aws_iam_policy_document.bucket_policy.json
}