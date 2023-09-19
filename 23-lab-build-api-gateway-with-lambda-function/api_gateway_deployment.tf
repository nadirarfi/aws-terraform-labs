resource "aws_api_gateway_deployment" "deployment" {
    rest_api_id = aws_api_gateway_rest_api.api.id
    triggers = {
      redeployment = sha1(jsonencode([
        aws_api_gateway_resource.resource.id,
        aws_api_gateway_method.method.id,
        aws_api_gateway_integration.MyDemoIntegration.id,     
      ]))         
    }
    depends_on = [aws_api_gateway_integration.MyDemoIntegration]
    lifecycle {
      create_before_destroy = true         
    }           
}