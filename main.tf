terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "mysqlserver" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  key_name = "terraformkey"
	
  tags = {
    Name = "ServerMySqlEc2"
  }
}

resource "aws_security_group_rule" "modifyDefault" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-0346ba87b08b8a698"
}


resource "aws_db_instance" "newDB" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.27"
  instance_class       = "db.t2.micro"
  name                 = "TFDBtest"
  username             = "admin"
  password             = "12345678"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  tags = {
    Name = "teraformDB"
  }
}