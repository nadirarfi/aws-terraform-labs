resource "aws_api_gateway_stage" "stage" {
    deployment_id = aws_api_gateway_deployment.deployment.id
    rest_api_id   = aws_api_gateway_rest_api.api.id
    stage_name    = "Test"         
}