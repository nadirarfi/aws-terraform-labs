resource "aws_api_gateway_resource" "resource" {
    parent_id   = aws_api_gateway_rest_api.api.root_resource_id
    path_part   = "whizapi"
    rest_api_id = aws_api_gateway_rest_api.api.id           
}