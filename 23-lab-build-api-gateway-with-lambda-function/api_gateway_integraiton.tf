resource "aws_api_gateway_integration" "MyDemoIntegration" {
    rest_api_id          = aws_api_gateway_rest_api.api.id
    resource_id          = aws_api_gateway_resource.resource.id
    http_method          = aws_api_gateway_method.method.http_method
    uri = aws_lambda_function.hello_function.invoke_arn
    integration_http_method     = "POST"
    type                 = "AWS"
    passthrough_behavior    = "WHEN_NO_TEMPLATES"           
}  

resource "aws_api_gateway_integration_response" "MyDemoIntegrationResponse" {
    rest_api_id = aws_api_gateway_rest_api.api.id
    resource_id = aws_api_gateway_resource.resource.id
    http_method = aws_api_gateway_method.method.http_method
    status_code = aws_api_gateway_method_response.response_200.status_code
    response_templates = {
         "application/json" = ""        
     }
     depends_on = [
      aws_api_gateway_integration.MyDemoIntegration         
    ]           
}