resource "aws_s3_bucket_policy" "read_access_policy" {
    bucket = aws_s3_bucket.website.id
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "${aws_s3_bucket.website.arn}",
                "${aws_s3_bucket.website.arn}/*"
            ]
        }
    ]
}
POLICY
}