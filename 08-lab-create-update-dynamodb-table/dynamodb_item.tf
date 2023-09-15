locals {
  json_data = file("./books.json")
    books = jsondecode(local.json_data)
  #books = [for book in local.json_data.books: jsonencode(book)]
}


resource "aws_dynamodb_table_item" "add_items" {
  for_each = local.books
  table_name = aws_dynamodb_table.books.name
  hash_key   = aws_dynamodb_table.books.hash_key
  item = jsonencode(each.value)
}

output "data" {
  value = local.books
}
