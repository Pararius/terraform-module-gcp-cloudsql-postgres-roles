terraform {
  required_version = "~> 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.70.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.14.0"
    }
  }
}
provider "google" {
  region  = "europe-west4"
  zone    = "europe-west4-a"
  project = "my-gcp-project"
}

module "db" {
  source = "github.com/Pararius/terraform-module-gcp-cloudsql-postgres.git"

  database_version   = "POSTGRES_13"
  databases          = ["db1", "db2"]
  environment        = "production"
  highly_available   = true
  instance_name      = "my-db-instance"
  storage_autoresize = false
}

provider "postgresql" {
  scheme   = "gcppostgres"
  host     = module.db.connection_name
  username = "postgres"
  password = module.db.admin_user_password
}

module "roles" {
  # source = "github.com/Pararius/terraform-module-gcp-cloudsql-postgres-roles.git"
  source = "../../"

  roles = {
    "role1": {
      databases_ro = ["db1", "db2"]
      databases_rw = []
    },
    "role2": {
      databases_ro = []
      databases_rw = ["db1", "db2"]
    },
    "role3": {
      databases_ro = ["db1"]
      databases_rw = ["db2"]
    },
  }
}
