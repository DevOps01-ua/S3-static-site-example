#terraform {
#  backend "s3" {
#    encrypt        = true
#    bucket         = "<replace_with_your_bucket_url>"
#    dynamodb_table = "<replace_with_dynamoDB table>"
#    key            = "infra/terraform.tfstate"
#    region         = "<replace-with-your-region"
#  }
#}