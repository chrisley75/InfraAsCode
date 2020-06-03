# amazon ami image
data "aws_ami" "Amazon_Linux_2_AMI" {
  most_recent   = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
      name   = "architecture"
      values = ["x86_64"]
  }
}


resource "aws_instance" "chrisley-ec2" {
  ami                    = "${data.aws_ami.Amazon_Linux_2_AMI.id}"
  count                  = "1"
  instance_type          = "t2.micro"
  key_name               = "demo_chrisley_rsa"
  security_groups        = ["chrisley-sg-admin","chrisley-sg-web"]

  tags = {  
    Name     = "chrisley-ec2-${count.index + 1}"
    Owner    = "chrisley"
    Project  = "demo"
    Resource = "ec2"
  }
}
