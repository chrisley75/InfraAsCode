terraform {
  backend "consul" {
    address = "159.8.79.167:8500"
    path    = "tf/dns-az_state"
  }
}
