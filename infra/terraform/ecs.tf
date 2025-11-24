# ECS Cluster
resource "aws_ecs_cluster" "app_cluster" {
  name = "${var.project_name}-cluster"
}

# Order Producer Task Definition
resource "aws_ecs_task_definition" "order_producer" {
  family                   = "${var.project_name}-producer-task"
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "order-producer"
      image     = "${var.producer_image}"
      essential = true
      portMappings = [
        {
          containerPort = 8080
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "KAFKA_BROKER"
          value = var.kafka_broker
        }
      ]
    }
  ])
}

# Order Producer Service
resource "aws_ecs_service" "order_producer" {
  name            = "${var.project_name}-producer-svc"
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.order_producer.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public_a.id, aws_subnet.public_b.id]
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = true
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

