```terraform
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.roles.postgresql_default_privileges.role_ro["db1.role2"] will be created
  + resource "postgresql_default_privileges" "role_ro" {
      + database          = "db1"
      + id                = (known after apply)
      + object_type       = "table"
      + owner             = "role2"
      + privileges        = [
          + "SELECT",
        ]
      + role              = "db1_role_ro"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_default_privileges.role_ro["db2.role2"] will be created
  + resource "postgresql_default_privileges" "role_ro" {
      + database          = "db2"
      + id                = (known after apply)
      + object_type       = "table"
      + owner             = "role2"
      + privileges        = [
          + "SELECT",
        ]
      + role              = "db2_role_ro"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_default_privileges.role_ro["db2.role3"] will be created
  + resource "postgresql_default_privileges" "role_ro" {
      + database          = "db2"
      + id                = (known after apply)
      + object_type       = "table"
      + owner             = "role3"
      + privileges        = [
          + "SELECT",
        ]
      + role              = "db2_role_ro"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_default_privileges.role_rw["db1.role2"] will be created
  + resource "postgresql_default_privileges" "role_rw" {
      + database          = "db1"
      + id                = (known after apply)
      + object_type       = "table"
      + owner             = "role2"
      + privileges        = [
          + "DELETE",
          + "INSERT",
          + "REFERENCES",
          + "SELECT",
          + "TRIGGER",
          + "TRUNCATE",
          + "UPDATE",
        ]
      + role              = "db1_role_rw"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_default_privileges.role_rw["db2.role2"] will be created
  + resource "postgresql_default_privileges" "role_rw" {
      + database          = "db2"
      + id                = (known after apply)
      + object_type       = "table"
      + owner             = "role2"
      + privileges        = [
          + "DELETE",
          + "INSERT",
          + "REFERENCES",
          + "SELECT",
          + "TRIGGER",
          + "TRUNCATE",
          + "UPDATE",
        ]
      + role              = "db2_role_rw"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_default_privileges.role_rw["db2.role3"] will be created
  + resource "postgresql_default_privileges" "role_rw" {
      + database          = "db2"
      + id                = (known after apply)
      + object_type       = "table"
      + owner             = "role3"
      + privileges        = [
          + "DELETE",
          + "INSERT",
          + "REFERENCES",
          + "SELECT",
          + "TRIGGER",
          + "TRUNCATE",
          + "UPDATE",
        ]
      + role              = "db2_role_rw"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_grant.role_ro["db1"] will be created
  + resource "postgresql_grant" "role_ro" {
      + database          = "db1"
      + id                = (known after apply)
      + object_type       = "table"
      + privileges        = [
          + "SELECT",
        ]
      + role              = "db1_role_ro"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_grant.role_ro["db2"] will be created
  + resource "postgresql_grant" "role_ro" {
      + database          = "db2"
      + id                = (known after apply)
      + object_type       = "table"
      + privileges        = [
          + "SELECT",
        ]
      + role              = "db2_role_ro"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_grant.role_rw["db1"] will be created
  + resource "postgresql_grant" "role_rw" {
      + database          = "db1"
      + id                = (known after apply)
      + object_type       = "table"
      + privileges        = [
          + "DELETE",
          + "INSERT",
          + "REFERENCES",
          + "SELECT",
          + "TRIGGER",
          + "TRUNCATE",
          + "UPDATE",
        ]
      + role              = "db1_role_rw"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_grant.role_rw["db2"] will be created
  + resource "postgresql_grant" "role_rw" {
      + database          = "db2"
      + id                = (known after apply)
      + object_type       = "table"
      + privileges        = [
          + "DELETE",
          + "INSERT",
          + "REFERENCES",
          + "SELECT",
          + "TRIGGER",
          + "TRUNCATE",
          + "UPDATE",
        ]
      + role              = "db2_role_rw"
      + schema            = "public"
      + with_grant_option = false
    }

  # module.roles.postgresql_role.role["role1"] will be created
  + resource "postgresql_role" "role" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = true
      + name                      = "role1"
      + password                  = (sensitive value)
      + replication               = false
      + roles                     = [
          + "db1_role_ro",
          + "db2_role_ro",
        ]
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.postgresql_role.role["role2"] will be created
  + resource "postgresql_role" "role" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = true
      + name                      = "role2"
      + password                  = (sensitive value)
      + replication               = false
      + roles                     = [
          + "db1_role_rw",
          + "db2_role_rw",
        ]
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.postgresql_role.role["role3"] will be created
  + resource "postgresql_role" "role" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = true
      + name                      = "role3"
      + password                  = (sensitive value)
      + replication               = false
      + roles                     = [
          + "db1_role_ro",
          + "db2_role_rw",
        ]
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.postgresql_role.role_ro["db1"] will be created
  + resource "postgresql_role" "role_ro" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = false
      + name                      = "db1_role_ro"
      + replication               = false
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.postgresql_role.role_ro["db2"] will be created
  + resource "postgresql_role" "role_ro" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = false
      + name                      = "db2_role_ro"
      + replication               = false
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.postgresql_role.role_rw["db1"] will be created
  + resource "postgresql_role" "role_rw" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = false
      + name                      = "db1_role_rw"
      + replication               = false
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.postgresql_role.role_rw["db2"] will be created
  + resource "postgresql_role" "role_rw" {
      + bypass_row_level_security = false
      + connection_limit          = -1
      + create_database           = false
      + create_role               = false
      + encrypted_password        = true
      + id                        = (known after apply)
      + inherit                   = true
      + login                     = false
      + name                      = "db2_role_rw"
      + replication               = false
      + skip_drop_role            = false
      + skip_reassign_owned       = false
      + superuser                 = false
      + valid_until               = "infinity"
    }

  # module.roles.random_password.role["role1"] will be created
  + resource "random_password" "role" {
      + id          = (known after apply)
      + length      = 48
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

  # module.roles.random_password.role["role2"] will be created
  + resource "random_password" "role" {
      + id          = (known after apply)
      + length      = 48
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

  # module.roles.random_password.role["role3"] will be created
  + resource "random_password" "role" {
      + id          = (known after apply)
      + length      = 48
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

Plan: 20 to add, 0 to change, 0 to destroy.
```