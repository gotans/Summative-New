
#Create Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

}


#Create Route Table
resource "aws_route_table" "public-crt" {
    vpc_id = aws_vpc.vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.igw.id 
    }
    
}

resource "aws_route_table_association" "crta-public-subnet-1"{
    subnet_id = aws_subnet.public-subnet-1.id
    route_table_id = aws_route_table.public-crt.id
}
resource "aws_route_table_association" "crta-public-subnet-2"{
    subnet_id = aws_subnet.public-subnet-2.id
    route_table_id = aws_route_table.public-crt.id
}
resource "aws_route_table_association" "crta-public-subnet-3"{
    subnet_id = aws_subnet.public-subnet-3.id
    route_table_id = aws_route_table.public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
    vpc_id = aws_vpc.vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
    Name = "Summative_SG"
  }
}