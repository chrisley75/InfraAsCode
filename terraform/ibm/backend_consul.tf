terraform {
  backend "consul" {
    address = "159.8.79.167:8500"
    path    = "tf/ibmcloud_state"
  }
}
