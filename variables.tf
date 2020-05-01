variable "interface" {
  description = "Interface to assign to the zone."
  type        = string
}

variable "interface_ips" {
  description = "IPs to assign the interface."
  type        = list
}

variable "interface_comment" {
  description = "Comment to describe the interface purpose."
}

variable "zone" {
  description = "Name of the zone."
  type        = string
}

variable "mode" {
  description = "Mode for the interface."
  type        = string
  default     = "layer3"
}

variable "vsys" {
  description = "vsys for the zone."
  type        = string
  default     = "vsys1"
}

variable "router" {
  description = "The router name for the zone and interface."
  type        = string
  default     = "default"
}

variable "enable_user_id" {
  description = "Whether or not to enable user-id on the zone."
  type        = bool
  default     = true
}
