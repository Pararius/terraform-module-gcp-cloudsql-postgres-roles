module "roles" {
  # source = "git@github.com:Pararius/terraform-module-gcp-cloudsql-postgres-roles.git"
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