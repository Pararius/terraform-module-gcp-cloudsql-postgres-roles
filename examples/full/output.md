```terraform
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.db.google_sql_database.database["db1"] will be created
  + resource "google_sql_database" "database" {
      + charset   = (known after apply)
      + collation = (known after apply)
      + id        = (known after apply)
      + instance  = "my-db-instance"
      + name      = "db1"
      + project   = (known after apply)
      + self_link = (known after apply)
    }

  # module.db.google_sql_database.database["db2"] will be created
  + resource "google_sql_database" "database" {
      + charset   = (known after apply)
      + collation = (known after apply)
      + id        = (known after apply)
      + instance  = "my-db-instance"
      + name      = "db2"
      + project   = (known after apply)
      + self_link = (known after apply)
    }

  # module.db.google_sql_database_instance.instance will be created
  + resource "google_sql_database_instance" "instance" {
      + connection_name               = (known after apply)
      + database_version              = "POSTGRES_13"
      + deletion_protection           = true
      + first_ip_address              = (known after apply)
      + id                            = (known after apply)
      + ip_address                    = (known after apply)
      + master_instance_name          = (known after apply)
      + name                          = "my-db-instance"
      + private_ip_address            = (known after apply)
      + project                       = (known after apply)
      + public_ip_address             = (known after apply)
      + region                        = (known after apply)
      + self_link                     = (known after apply)
      + server_ca_cert                = (known after apply)
      + service_account_email_address = (known after apply)

      + replica_configuration {
          + ca_certificate            = (known after apply)
          + client_certificate        = (known after apply)
          + client_key                = (known after apply)
          + connect_retry_interval    = (known after apply)
          + dump_file_path            = (known after apply)
          + failover_target           = (known after apply)
          + master_heartbeat_period   = (known after apply)
          + password                  = (sensitive value)
          + ssl_cipher                = (known after apply)
          + username                  = (known after apply)
          + verify_server_certificate = (known after apply)
        }

      + settings {
          + activation_policy     = "ALWAYS"
          + availability_type     = "REGIONAL"
          + disk_autoresize       = false
          + disk_autoresize_limit = 0
          + disk_size             = 0
          + disk_type             = "PD_SSD"
          + pricing_plan          = "PER_USE"
          + tier                  = "db-custom-2-8192"
          + user_labels           = {
              + "env" = "production"
            }
          + version               = (known after apply)

          + backup_configuration {
              + enabled                        = true
              + location                       = "eu"
              + start_time                     = (known after apply)
              + transaction_log_retention_days = (known after apply)

              + backup_retention_settings {
                  + retained_backups = (known after apply)
                  + retention_unit   = (known after apply)
                }
            }

          + ip_configuration {
              + ipv4_enabled = true
              + require_ssl  = true
            }

          + location_preference {
              + follow_gae_application = (known after apply)
              + zone                   = (known after apply)
            }

          + maintenance_window {
              + day  = 1
              + hour = 4
            }
        }
    }

  # module.db.google_sql_user.postgres_user will be created
  + resource "google_sql_user" "postgres_user" {
      + host     = (known after apply)
      + id       = (known after apply)
      + instance = "my-db-instance"
      + name     = "postgres"
      + password = (sensitive value)
      + project  = (known after apply)
    }

  # module.db.random_password.admin_user will be created
  + resource "random_password" "admin_user" {
      + id          = (known after apply)
      + length      = 48
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (sensitive value)
      + special     = true
      + upper       = true
    }

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

Plan: 25 to add, 0 to change, 0 to destroy.
```