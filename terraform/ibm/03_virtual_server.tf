# Creation du serveur virtuel
# Create a virtual server with the SSH key
# https://ibm-cloud.github.io/tf-ibm-docs/v0.9.1/r/compute_vm_instance.html

resource "ibm_compute_vm_instance" "demo-elk-chrisley01" {
  hostname          = "demo-elk-chrisley01"
  domain            = "chrisley.ibm"
  ssh_key_ids       = ["${ibm_compute_ssh_key.demo_chrisley_rsa.id}"]
#  os_reference_code = "CENTOS_6_64"
## Récuperation de l'image ID dans l'URL de l'image quand on clique dessus depuis le portail IBM Devices > Manage > Images
## To retrieve the image template ID from the IBM Cloud infrastructure customer portal, navigate to Devices > Manage > Images, click the image that you want, and note the ID number in the resulting URL. 
#  image_id          = "763925"
  image_id          = "1354507"
  datacenter        = "par01"
  network_speed     = 100
  cores             = 4
  memory            = 8192
  tags = [
     "demo-iac",
     "elk",
     "chrisley"
   ]
  public_security_group_ids = ["${ibm_security_group.cley_demo.id}"] 
}

#resource "ibm_network_public_ip" "demo-elk-global-ip" {
#  routes_to = ibm_compute_vm_instance.demo-elk-chrisley01.ipv4_address
#}
