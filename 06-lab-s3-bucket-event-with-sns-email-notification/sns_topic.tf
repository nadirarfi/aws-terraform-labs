data "aws_iam_policy_document" "topic" {

  statement {
    effect  = "Allow"
    actions = ["sns:Publish"]

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    resources = [
      "arn:aws:sns:${var.region}:${var.account_id}:${var.topic_name}"
    ]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.my_bucket.arn]
    }

  }
}

resource "aws_sns_topic" "my_topic" {
  name   = var.topic_name
  policy = data.aws_iam_policy_document.topic.json
}

output "sns_policy" {
  description = "SNS Policy"
  value       = data.aws_iam_policy_document.topic.json
}

output "topic_arn1" {
  value       = aws_sns_topic.my_topic.arn
  description = "Topic created successfully"
}