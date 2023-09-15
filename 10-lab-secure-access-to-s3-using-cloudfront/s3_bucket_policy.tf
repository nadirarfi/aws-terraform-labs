data "aws_iam_policy_document" "bucket" {

  statement {
    effect  = "Allow"
    actions = ["s3:list*", "s3:get*", "s3:putobject"]

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
    policy = data.aws_iam_policy_document.bucket.json
}

output "bucket_policy" {
  description = "Bucket Policy"
  value = data.aws_iam_policy_document.bucket.json
}