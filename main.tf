terraform {
  required_version = ">= 1.0.0"
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.14.0"
    }
  }
}

provider "postgresql" {
  scheme   = "gcppostgres"
  host     = var.connection_name
  username = var.admin_username
  password = var.admin_password
}
