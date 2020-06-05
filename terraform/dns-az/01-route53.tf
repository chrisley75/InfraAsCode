# Gestion des enregistrements (records) de la route53 (DNS AWS)
# https://www.terraform.io/docs/providers/aws/r/route53_record.html
# Declaration de la zone
data "aws_route53_zone" "chrisley" {
  name         = "chrisley.fr."
  private_zone = false
}

############ elk azure
# Creation des enregistrements (records) DNS pour eis-public=ip-public-server et ip-interne=ip-private-server
# Creation des resolutions DNS
# Déclaration IP Publique pour tous le serveurs ELK pour "elk azure"
resource "aws_route53_record" "elk" {
  zone_id = "${data.aws_route53_zone.chrisley.zone_id}"
  name    = "elk.chrisley.fr"
  type    = "A"
  ttl     = "300"
  records = ["${var.ELK_PUBLIC_IP}"]
}


############# www aws
# declaration des instances pour recuperation du nom

data "aws_instance" "chrisley-ec2-1" {
  filter {
        name    = "tag:Name"
        values  = ["chrisley-ec2-1"]
  }
}


# recuperation des ElasticIP (eip) en fonction des instances déclarées au dessus

resource "aws_eip" "chrisley-ec2-1" {
  instance = "${data.aws_instance.chrisley-ec2-1.id}"
  vpc      = true
}

# Creation des enregistrements (records) DNS pour eis-public=ip-public-server et ip-interne=ip-private-server
# Creation des resolutions DNS
# Déclaration IP Publique pour tous le serveurs WEB pour "www"
resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.chrisley.zone_id}"
  name    = "www.chrisley.fr"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.chrisley-ec2-1.public_ip}"]
}

