resource "panos_ethernet_interface" "gateway" {
  name       = var.interface
  vsys       = var.vsys
  mode       = var.mode
  static_ips = var.interface_ips
  comment    = var.interface_comment
}

resource "panos_virtual_router_entry" "interface_to_router" {
  virtual_router = var.router
  interface      = panos_ethernet_interface.gateway.name
}

resource "panos_zone" "zone" {
  name           = var.zone
  mode           = var.mode
  enable_user_id = var.enable_user_id
}

resource "panos_zone_entry" "interface_to_zone" {
  zone      = panos_zone.zone.name
  mode      = panos_zone.zone.mode
  interface = panos_ethernet_interface.gateway.name
}
