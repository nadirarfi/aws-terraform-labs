resource "aws_elastic_beanstalk_application" "my_app" {
  name        = "tf-test-app"
  description = "My Java Application"

}

output "app_arn" {
  value = aws_elastic_beanstalk_application.my_app.arn
}