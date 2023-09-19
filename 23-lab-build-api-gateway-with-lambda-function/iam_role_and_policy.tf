data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
    ]
    resources = ["*"]
    condition {
        test     = "StringEquals"
        variable = "aws:RequestedRegion"
        values = [
            "us-east-1"
        ]      
    }


    
  }
}

resource "aws_iam_policy" "policy" {
  name        = "lambda-policy"
  description = "Lambda CloudWatch policy"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
    role       = aws_iam_role.iam_for_lambda.name
    #policy_arn = aws_iam_policy.policy.arn  
    policy_arn =  "arn:aws:iam::144976996549:policy/lambda_Rolepolicy"
}