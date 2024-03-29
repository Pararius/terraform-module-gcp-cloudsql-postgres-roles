resource "random_password" "role" {
  for_each = var.roles

  length      = 48
  min_lower   = 0
  min_numeric = 0
  min_special = 0
  min_upper   = 0

  lower   = true
  numeric = true
  special = false
  upper   = true

  lifecycle {
    ignore_changes = [lower, numeric, special, upper]
  }
}

resource "postgresql_role" "role" {
  for_each = var.roles

  name                      = each.key
  superuser                 = false
  create_database           = false
  create_role               = false
  inherit                   = true
  login                     = true
  replication               = false
  bypass_row_level_security = false
  connection_limit          = coalesce(each.value.connection_limit, -1)
  encrypted_password        = true
  password                  = random_password.role[each.key].result
  roles = concat(
    [for database in each.value.databases_ro : "${database}_role_ro"],
    [for database in each.value.databases_rw : "${database}_role_rw"],
  )
  search_path         = ["$user", "public"]
  valid_until         = "infinity"
  skip_drop_role      = false
  skip_reassign_owned = false
  statement_timeout   = 0
}

resource "postgresql_grant" "public" {
  for_each = local.databases

  database          = each.value
  role              = "public"
  schema            = "public"
  object_type       = "schema"
  privileges        = []
  with_grant_option = false
}

resource "postgresql_role" "role_ro" {
  for_each = local.databases

  name                      = "${each.key}_role_ro"
  superuser                 = false
  create_database           = false
  create_role               = false
  inherit                   = false
  login                     = false
  replication               = false
  bypass_row_level_security = false
  connection_limit          = -1
  encrypted_password        = true
  password                  = "not-used-as-login-is-false"
  roles                     = []
  search_path               = ["$user", "public"]
  valid_until               = "infinity"
  skip_drop_role            = false
  skip_reassign_owned       = false
  statement_timeout         = 0
}

resource "postgresql_default_privileges" "role_ro_table" {
  for_each = {
    for database_writer in local.databases_writers : "${database_writer.database}.${database_writer.role}" => database_writer
  }

  role        = postgresql_role.role_ro[each.value.database].name
  database    = each.value.database
  owner       = each.value.role
  schema      = "public"
  object_type = "table"
  privileges  = local.privileges_ro
}

resource "postgresql_default_privileges" "role_ro_sequence" {
  for_each = {
    for database_writer in local.databases_writers : "${database_writer.database}.${database_writer.role}" => database_writer
  }

  role        = postgresql_role.role_ro[each.value.database].name
  database    = each.value.database
  owner       = each.value.role
  schema      = "public"
  object_type = "sequence"
  privileges  = local.privileges_ro
}

resource "postgresql_grant" "role_ro_table" {
  for_each = local.databases

  role              = postgresql_role.role_ro[each.value].name
  database          = each.value
  schema            = "public"
  object_type       = "table"
  privileges        = local.privileges_ro
  objects           = []
  with_grant_option = false
}

resource "postgresql_grant" "role_ro_sequence" {
  for_each = local.databases

  role              = postgresql_role.role_ro[each.value].name
  database          = each.value
  schema            = "public"
  object_type       = "sequence"
  privileges        = local.privileges_ro
  objects           = []
  with_grant_option = false
}

resource "postgresql_grant" "role_ro_schema" {
  for_each = local.databases

  role              = postgresql_role.role_ro[each.value].name
  database          = each.value
  schema            = "public"
  object_type       = "schema"
  privileges        = ["USAGE"]
  with_grant_option = false
}

resource "postgresql_role" "role_rw" {
  for_each = local.databases

  name                      = "${each.key}_role_rw"
  superuser                 = false
  create_database           = false
  create_role               = false
  inherit                   = false
  login                     = false
  replication               = false
  bypass_row_level_security = false
  connection_limit          = -1
  encrypted_password        = true
  password                  = "not-used-as-login-is-false"
  roles                     = []
  search_path               = ["$user", "public"]
  valid_until               = "infinity"
  skip_drop_role            = false
  skip_reassign_owned       = false
  statement_timeout         = 0
}

resource "postgresql_default_privileges" "role_rw_table" {
  for_each = {
    for database_writer in local.databases_writers : "${database_writer.database}.${database_writer.role}" => database_writer
  }

  role        = postgresql_role.role_rw[each.value.database].name
  database    = each.value.database
  owner       = each.value.role
  schema      = "public"
  object_type = "table"
  privileges  = local.privileges_rw_tables
}

resource "postgresql_default_privileges" "role_rw_sequence" {
  for_each = {
    for database_writer in local.databases_writers : "${database_writer.database}.${database_writer.role}" => database_writer
  }

  role        = postgresql_role.role_rw[each.value.database].name
  database    = each.value.database
  owner       = each.value.role
  schema      = "public"
  object_type = "sequence"
  privileges  = local.privileges_rw_sequences
}

resource "postgresql_grant" "role_rw_table" {
  for_each = local.databases

  role              = postgresql_role.role_rw[each.value].name
  database          = each.value
  schema            = "public"
  object_type       = "table"
  privileges        = local.privileges_rw_tables
  objects           = []
  with_grant_option = false
}

resource "postgresql_grant" "role_rw_sequence" {
  for_each = local.databases

  role              = postgresql_role.role_rw[each.value].name
  database          = each.value
  schema            = "public"
  object_type       = "sequence"
  privileges        = local.privileges_rw_sequences
  objects           = []
  with_grant_option = false
}

resource "postgresql_grant" "role_rw_schema" {
  for_each = local.databases

  role              = postgresql_role.role_rw[each.value].name
  database          = each.value
  schema            = "public"
  object_type       = "schema"
  privileges        = ["CREATE", "USAGE"]
  with_grant_option = false
}


moved {
  from = postgresql_default_privileges.role_ro
  to   = postgresql_default_privileges.role_ro_table
}

moved {
  from = postgresql_default_privileges.role_rw
  to   = postgresql_default_privileges.role_rw_table
}
