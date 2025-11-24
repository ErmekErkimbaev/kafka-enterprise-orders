variable "project_name" {
  type        = string
  description = "Project name"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "kafka_broker" {
  type        = string
  description = "Kafka broker address"
}

variable "producer_image" {
  type        = string
  description = "Docker image for order producer"
}

variable "analytics_image" {
  type        = string
  description = "Docker image for analytics service"
}

variable "api_image" {
  type        = string
  description = "Docker image for API service"
}

variable "fraud_image" {
  type        = string
  description = "Docker image for fraud service"
}

variable "payment_image" {
  type        = string
  description = "Docker image for payment service"
}

variable "rds_password" {
  type        = string
}

variable "rds_db_name" {
  type        = string
}

variable "rds_instance_class" {
  type        = string
}

variable "rds_allocated_storage" {
  type = number
}

variable "rds_backup_retention" {
  type = number
}

variable "rds_multi_az" {
  type = bool
}

variable "rds_public_access" {
  type = bool
}

variable "rds_storage_type" {
  type = string
}

variable "rds_deletion_protection" {
  type = bool
}

variable "rds_username" {
  description = "Username for the RDS database"
  type        = string
}

