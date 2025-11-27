terraform {
  backend "s3" {
    bucket         = "kafka-enterprise-orders-terraform-state"  # твой S3 bucket
    key            = "kafka-enterprise-orders/terraform.tfstate" # путь к файлу стейта
    region         = "us-east-1"                                 # регион S3
    dynamodb_table = "terraform-locks"                           # таблица для блокировок
    encrypt        = true                                        # шифруем стейт
  }
}

