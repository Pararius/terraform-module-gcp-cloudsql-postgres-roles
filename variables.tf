variable "connection_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "roles" {
  type = map(object({
    databases_ro = list(string)
    databases_rw = list(string)
  }))
}
