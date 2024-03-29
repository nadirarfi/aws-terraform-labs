resource "aws_lambda_permission" "api_gw" {
    statement_id  = "AllowExecutionFromAPIGateway"
    action        = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.hello_function.function_name}"
    principal     = "apigateway.amazonaws.com"
    source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"           
}