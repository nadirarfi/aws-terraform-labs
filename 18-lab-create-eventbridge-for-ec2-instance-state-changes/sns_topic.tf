data "aws_iam_policy_document" "topic_policy" {

  statement {
    effect  = "Allow"
    actions = ["sns:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [
      "arn:aws:sns:${var.region}:${var.account_id}:${var.topic_name}"
    ]

  }
}

resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
  policy = data.aws_iam_policy_document.topic_policy.json
}




