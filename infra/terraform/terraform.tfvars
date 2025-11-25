project_name = "kafka-enterprise-orders"
aws_region   = "us-east-1"

kafka_broker = "broker:29092"
producer_image = "ghcr.io/ermekerkimbaev/kafka-enterprise-orders/order-producer:latest"
analytics_image = "ghcr.io/ermekerkimbaev/kafka-enterprise-orders/order-analytics:latest"
api_image       = "ghcr.io/ermekerkimbaev/kafka-enterprise-orders/order-api:latest"
fraud_image     = "ghcr.io/ermekerkimbaev/kafka-enterprise-orders/order-fraud:latest"
payment_image   = "ghcr.io/ermekerkimbaev/kafka-enterprise-orders/order-payment:latest"

rds_password       = "MyRds1988"
rds_db_name        = "orders_db"
rds_instance_class = "db.t4g.micro"
rds_allocated_storage = 20
rds_backup_retention = 1
rds_multi_az       = false
rds_public_access  = true
rds_storage_type   = "gp2"
rds_deletion_protection = false
rds_username = "dbadmin"

