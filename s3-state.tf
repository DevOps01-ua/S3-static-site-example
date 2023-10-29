resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops01-ua-practicum-bucket" #move to variable
  tags = {
    Name = "Terraform state bucket"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo-test" #move to variables
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}