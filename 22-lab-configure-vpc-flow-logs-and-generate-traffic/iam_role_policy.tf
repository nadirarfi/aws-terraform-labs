data "aws_iam_policy_document" "vpc_flow_logs_policy" {
  statement {
    effect = "Allow"

    resources = ["*"]
    actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:Describe*",
        "logs:DescribeLogStreams"        
    ]
    
    condition {
      test = "StringEquals"
      variable = "aws:RequestedRegion"
      values = ["us-east-1"]
    }
  }
}

resource "aws_iam_policy" "vpc_flow_logs_policy" {
  name               = "vpc-flowlogs-policy"
  policy  = data.aws_iam_policy_document.vpc_flow_logs_policy.json
}


data "aws_iam_policy_document" "vpc_flow_logs_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vpc_flow_logs_role" {
  name               = "vpc-flowlogs-role"
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_assume_role.json
}


resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.vpc_flow_logs_role.name}"
  policy_arn = "${aws_iam_policy.vpc_flow_logs_policy.arn}"
}

