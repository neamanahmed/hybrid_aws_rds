provider "aws" {
  region = "me-central-1"
}

# RDS instance (MySQL)
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  identifier           = "eurodb"
  db_name              = "dxbeuro"
  engine               = "mysql"
  engine_version       = "8.0.42"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "ItsN*$ou" # Hardcoded only for testing
  parameter_group_name = "default.mysql8.0"

  skip_final_snapshot    = true
  publicly_accessible    = true # So you can connect for testing
  vpc_security_group_ids = ["sg-xxxxxxxxxxxxxxxxx"]
  db_subnet_group_name   = "ae_rds_sbnet_grp"
  tags = {
    Name        = "dxbeuro-db"
    Environment = "dev"
  }


}

# Output the RDS endpoint
output "rds_endpoint" {
  value = aws_db_instance.default.address
}
