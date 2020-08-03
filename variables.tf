variable "zone" {
  description = "Zone settings."
}

variable "zone_defaults" {
  type = object({
    interface = string
    ips       = list(string)
    name      = string
    comment   = string
    mode      = string
    vsys      = string
    router    = string
    user_id   = bool
  })

  default = {
    interface = ""
    ips       = []
    name      = ""
    comment   = ""
    mode      = "layer3"
    vsys      = "vsys1"
    router    = "default"
    user_id   = true
  }
}
