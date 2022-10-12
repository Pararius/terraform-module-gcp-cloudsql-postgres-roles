variable "legacy_writers" {
  type    = list(string)
  default = []
}

variable "roles" {
  type = map(object({
    databases_ro = list(string)
    databases_rw = list(string)
  }))
}
