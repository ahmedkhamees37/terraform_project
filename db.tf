# ---------------------- create rds instance -----------------------


resource "aws_db_instance" "iti_mysql_instance" {
  allocated_storage    = 10
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  #name                 = var.name
  username             = var.username
  password             = var.password
  # parameter_group_name = var.parameter_group_name
  allow_major_version_upgrade = true
  availability_zone = "${var.region}a"
  skip_final_snapshot  = true
  vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-group.name
}


resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "rds-subnet-group"
  subnet_ids = ["${module.network.iti_private_subnet1_id}", "${module.network.iti_private_subnet2_id}"]
}

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "iti-cache-subnets"
  subnet_ids = ["${module.network.iti_private_subnet1_id}", "${module.network.iti_private_subnet2_id}"]
}

resource "aws_elasticache_cluster" "iti_elasticache_cluster" {
  cluster_id           = "iti-elasticache-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids = [aws_security_group.redis_sg.id]

}
