resource "aws_instance" "public" {
  ami                         = "ami-04c913012f8977029" #ap-southeast-1
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0cc94b815da8f0c95"
  associate_public_ip_address = true
  key_name                    = "aldindc-keypair-20240625" #Change to your keyname 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 
  tags = {
    Name = "aldindc-ec2"    #Change to your name
  }
}


resource "aws_security_group" "allow_ssh" {
  name        = "aldindc-security-grp"  #change to your name
  description = "Allow SSH inbound and all outbound"
  vpc_id      = "vpc-071f8836040c9beba"  #VPC Id of the default VPC
}


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "182.19.156.200/32"  #Get your public ip from whatismyip.com.Add /32
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


