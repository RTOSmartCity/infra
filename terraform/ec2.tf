resource "aws_security_group" "ec2_sg" {
  name        = "ec2-instance-sg"
  description = "Security group for EC2 instances in smart-city infrastructure"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "smart-city-ec2-sg"
  }
}

resource "aws_instance" "instance_1" {
  ami                    = "ami-02bd7b9e243f4d1bc"
  instance_type          = "t4g.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "blls"

  user_data = file("${path.module}/instance1-userdata.sh")

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name        = "smart-city-instance-1"
    Environment = "smart-city"
    Terraform   = "true"
  }
}


resource "aws_instance" "instance_2" {
  ami                    = "ami-02bd7b9e243f4d1bc"
  instance_type          = "t4g.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "blls"

  user_data = file("${path.module}/instance2-userdata.sh")

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name        = "smart-city-instance-2"
    Environment = "smart-city"
    Terraform   = "true"
  }
}

resource "aws_eip_association" "instance_1_eip_assoc" {
  instance_id   = aws_instance.instance_1.id
  allocation_id = "eipalloc-0bfccb260d4a200b1"
}

resource "aws_eip_association" "instance_2_eip_assoc" {
  instance_id   = aws_instance.instance_2.id
  allocation_id = "eipalloc-07a52dbb36855de0a"
}
