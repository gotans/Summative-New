resource "aws_instance" "summative_ec2" {
 
  ami           = var.instance_ami
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public-subnet-1.id

  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]

  key_name = aws_key_pair.region-key-pair.id

  connection {
    user        = var.EC2_USER
    private_key = file(var.public_key_path)
  }

  tags = {
    "Name" = "summative_ec2_ubuntu"
  }
}

resource "aws_key_pair" "region-key-pair" {
  key_name   = "region-key-pair"
  public_key = file(var.public_key_path)
}

resource "aws_eip" "eip" {
  instance = aws_instance.summative_ec2.id
  tags = {
    Name = "eip1"
  }

  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_eip" "eip2" {
  
  tags = {
    Name = "eip2"
  }

  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip2.id
  subnet_id = aws_subnet.public-subnet-1.id
  tags = {
    Name = "gw NAT"
  }
}