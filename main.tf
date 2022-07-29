resource "aws_instance" "ec2-ilhan" {
  ami = var.ec2_ami
  instance_type = var.ec2_type
  key_name = var.key_name
  security_groups = [var.aws_security_group]

  user_data = <<-EOF
  #! /bin/bash
  sudo yum -y install httpd
  sudo systemctl enable httpd
  sudo systemctl start httpd
  echo "Welcome to Nax Technology" | sudo tee /var/www/html/index.html
  EOF
  
  tags = {
    "Name" = "ec2-ilhan"
  }
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = var.s3_bucket_name
}
resource "aws_security_group" "sec-gr" {
  name = var.aws_security_group
  tags = {
    Name = "web-sec-gr-ilhan"      
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      protocol = "tcp"
      to_port = 22
      cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
      from_port = 0
      protocol = -1
      to_port = 0
      cidr_blocks = [ "0.0.0.0/0" ]
  }
}

