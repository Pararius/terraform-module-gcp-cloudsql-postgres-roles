resource "random_password" "role" {
  for_each = var.roles

  length  = 48
  special = false
}

resource "postgresql_role" "role" {
  for_each = var.roles

  name     = each.key
  login    = true
  password = random_password.role[each.key].result
  roles = concat(
    [for database in each.value.databases_ro : "${database}_role_ro"],
    [for database in each.value.databases_rw : "${database}_role_rw"],
  )
}

resource "postgresql_role" "role_ro" {
  for_each = local.databases

  name  = "${each.value}_role_ro"
  login = false
}

resource "postgresql_default_privileges" "role_ro" {
  for_each = {
    for database_writer in local.databases_writers : "${database_writer.database}.${database_writer.role}" => database_writer
  }

  database    = each.value.database
  role        = postgresql_role.role_ro[each.value.database].name
  owner       = each.value.role
  schema      = "public"
  object_type = "table"
  privileges  = local.privileges_ro
}

resource "postgresql_grant" "role_ro" {
  for_each = local.databases

  database    = each.value
  role        = postgresql_role.role_ro[each.value].name
  schema      = "public"
  object_type = "table"
  privileges  = local.privileges_ro
}

resource "postgresql_role" "role_rw" {
  for_each = local.databases

  name  = "${each.value}_role_rw"
  login = false
}

resource "postgresql_default_privileges" "role_rw" {
  for_each = {
    for database_writer in local.databases_writers : "${database_writer.database}.${database_writer.role}" => database_writer
  }

  database    = each.value.database
  role        = postgresql_role.role_rw[each.value.database].name
  owner       = each.value.role
  schema      = "public"
  object_type = "table"
  privileges  = local.privileges_rw
}

resource "postgresql_grant" "role_rw" {
  for_each = local.databases

  database    = each.value
  role        = postgresql_role.role_rw[each.value].name
  schema      = "public"
  object_type = "table"
  privileges  = local.privileges_rw
}

