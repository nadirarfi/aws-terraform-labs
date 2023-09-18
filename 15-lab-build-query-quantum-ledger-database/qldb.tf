resource "aws_qldb_ledger" "ledger" {
  name = "DMV"  
  permissions_mode = "ALLOW_ALL"
  deletion_protection = false   
}

output "aws_qldb_ledger_arn" {  
  value = aws_qldb_ledger.ledger.arn        
}	