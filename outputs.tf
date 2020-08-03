output "gateway" {
  value = panos_ethernet_interface.gateway
}

output "zone" {
  value = panos_zone.zone
}

output "virtual_router_entry" {
  value = panos_virtual_router_entry.interface_to_router
}

output "zone_entry" {
  value = panos_zone_entry.interface_to_zone
}
