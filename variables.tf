variable "vpc_config" {
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The vpc_config.cidr_block value must be a valid CIDR block."
  }
}

variable "subnet_config" {
  type = map(
    object({
      # name       = string
      cidr_block = string
      az         = string
      public = optional(bool, false)
      # nat_gateway = bool
      # route_table = string
    })
  )

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The subnet_config.cidr_block value must be a valid CIDR block."
  }
}