variable "vpc_config" {
  description = "VPC configuration. Required CIDR block and the VPC name."
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
  description = <<EOF
  Subnet configuration. Accepts a map of subnet configurations.
  cidr-block: Required CIDR block
  az: availability zone
  public: boolean, defaults to false
  EOF
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