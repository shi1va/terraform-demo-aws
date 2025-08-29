resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-infra-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = "studentID"
    type = "S"
  }
  tags = {
    Name        = "${var.env}-infra-dynamodb-table"
  }
}