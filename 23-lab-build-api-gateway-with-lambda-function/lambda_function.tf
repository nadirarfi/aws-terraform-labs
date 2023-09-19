resource "aws_lambda_function" "hello_function" {
    filename      = "lambda_function.zip"
    function_name = "hello-function"
    role          = aws_iam_role.iam_for_lambda.arn
    handler       = "lambda_function.lambda_handler"
    runtime = "python3.8"
    source_code_hash = filebase64sha256("lambda_function.zip")           
}