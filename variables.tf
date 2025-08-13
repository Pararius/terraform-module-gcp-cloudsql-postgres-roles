variable "legacy_writers" {
  type    = list(string)
  default = []
}

variable "instance_id" {
  type    = string
  default = null
}

variable "roles" {
  type = map(object({
    connection_limit = optional(number)
    databases_ro     = list(string)
    databases_rw     = list(string)
    type             = optional(string, "BUILT_IN")
  }))

  validation {
    condition = alltrue([
      for u in var.roles : contains(["BUILT_IN", "CLOUD_IAM_USER", "CLOUD_IAM_GROUP", "CLOUD_IAM_SERVICE_ACCOUNT"], u.type)
    ])
    error_message = "Invalid user type. Only BUILT_IN, CLOUD_IAM_USER, CLOUD_IAM_GROUP, CLOUD_IAM_SERVICE_ACCOUNT are supported."
  }
}
