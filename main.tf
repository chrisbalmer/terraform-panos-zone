locals {
  zone = merge(var.zone_defaults, var.zone)
}

resource "panos_ethernet_interface" "gateway" {
  name               = local.zone.interface
  vsys               = local.zone.vsys
  mode               = local.zone.mode
  static_ips         = local.zone.ips
  management_profile = local.zone.management_profile
  comment            = local.zone.comment
}

resource "panos_virtual_router_entry" "interface_to_router" {
  virtual_router = local.zone.router
  interface      = panos_ethernet_interface.gateway.name
}

resource "panos_zone" "zone" {
  name           = local.zone.name
  mode           = local.zone.mode
  enable_user_id = local.zone.user_id
  log_setting    = local.zone.log_setting
}

resource "panos_zone_entry" "interface_to_zone" {
  zone      = panos_zone.zone.name
  mode      = panos_zone.zone.mode
  interface = panos_ethernet_interface.gateway.name
}

# resource "panos_management_profile" "mgmt_profile" {
#   name          = "allow ping"
#   ping          = true
#   permitted_ips = ["10.1.1.0/24", "192.168.80.0/24"]
# }
