resource "aws_security_group" "chrisley-sg-admin" {
  name        = "chrisley-sg-admin"
  description = "Admin Security Group for chrisley project"
  
  tags = {
    Name     = "chrisley-sg-admin"
    Owner    = "chrisley"
    Project  = "demo"
    Resource = "security-group"
  }
}

resource "aws_security_group" "chrisley-sg-web" {
  name        = "chrisley-sg-web"
  description = "Web Security Group for chrisley project"

  tags = {  
    Name     = "chrisley-sg-web"
    Owner    = "chrisley"
    Project  = "demo"
    Resource = "security-group"
  }
}

## Create Security Group Rules
## https://www.terraform.io/docs/providers/aws/r/security_group_rule.html

resource "aws_security_group_rule" "ssh-from-internet" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  # only authorize my public IP (livebox public IP), set the list below (work, home, etc...)
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.chrisley-sg-admin.id}"
}

resource "aws_security_group_rule" "egress-all" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  # only authorize my public IP (livebox public IP), set the list below (work, home, etc...)
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.chrisley-sg-admin.id}"
}

resource "aws_security_group_rule" "http-web" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  # all cidr for HTTP
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.chrisley-sg-web.id}"
}

resource "aws_security_group_rule" "https-web" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  # all cidr for HTTPS
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.chrisley-sg-web.id}"
}

