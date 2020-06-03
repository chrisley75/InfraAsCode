### Define outputs

output "ip-pub-chrisley" {
    value	= "${aws_instance.chrisley-ec2.*.public_ip}"
    description = "Adresse publique l'instance ec2."
}
