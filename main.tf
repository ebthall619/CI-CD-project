resource "aws_instance" "my_ec2" {
  ami = var.image
  instance_type = var.instance-flavor
  security_groups = [ aws_security_group.my_sec_group.name ]
  key_name = data.aws_key_pair.my_key_pair.key_name

  tags = {
    Name = "nodejs-app"
  }
}

resource "aws_eip" "my_eip" {
    vpc = true
}

resource "aws_eip_association" "my_association" {
  instance_id = aws_instance.my_ec2.id
  allocation_id = aws_eip.my_eip.id
}

resource "aws_security_group" "my_sec_group" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name= "my_sec_group"
  }
}

data "aws_key_pair" "my_key_pair" {
  key_name = "test"
}

output "my_ip" {
  value = aws_eip.my_eip.public_ip
}
