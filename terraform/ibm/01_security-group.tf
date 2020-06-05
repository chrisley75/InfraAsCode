#### Création du security group
### https://ibm-cloud.github.io/tf-ibm-docs/v0.9.1/r/security_group.html

resource "ibm_security_group" "cley_demo" {
    name = "cley_demo"
}


#### Création des regles de securité à associer au security group
### https://ibm-cloud.github.io/tf-ibm-docs/v0.9.1/r/security_group_rule.html

resource "ibm_security_group_rule" "cley_demo_allow_port_22" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = "${ibm_security_group.cley_demo.id}"
}

resource "ibm_security_group_rule" "cley_demo_allow_port_5601" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 5601
    port_range_max = 5601
    protocol = "tcp"
    security_group_id = "${ibm_security_group.cley_demo.id}"
}

resource "ibm_security_group_rule" "cley_demo_allow_port_5044" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 5044
    port_range_max = 5044
    protocol = "tcp"
    security_group_id = "${ibm_security_group.cley_demo.id}"
}

resource "ibm_security_group_rule" "cley_demo_allow_port_9200" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 9200
    port_range_max = 9200
    protocol = "tcp"
    security_group_id = "${ibm_security_group.cley_demo.id}"
}

resource "ibm_security_group_rule" "cley_demo_allow_egress_all" {
    direction = "egress"
    ether_type = "IPv4"
    port_range_min = 0
    port_range_max = 0
    protocol = "tcp"
    security_group_id = "${ibm_security_group.cley_demo.id}"
}

#### Attachement du security group à la NIC
### https://ibm-cloud.github.io/tf-ibm-docs/v0.9.1/r/network_interface_sg_attachment.html

#resource "ibm_network_interface_sg_attachment" "demo_cley_sg_attachement" {
#    security_group_id = "${ibm_security_group.cley_demo.id}"
#    network_interface_id = "${ibm_compute_vm_instance.demo-elk-chrisley01.public_interface_id}"
#}
