resource "aws_key_pair" "my_key" {
  key_name   = var.key_pair_name
  public_key = file("nadir-key.pub")
}