resource "aws_dynamodb_table" "books" {
  name           = "books"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "ISBN"

  attribute {
    name = "ISBN"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }



}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.books.arn
  description = "Table books created successfully"
}