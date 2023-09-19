resource "aws_api_gateway_rest_api" "api" {
    name        = "My API"
    description = "This is my API for demonstration purposes"
    endpoint_configuration {
        types     = ["REGIONAL"]       
    }
}