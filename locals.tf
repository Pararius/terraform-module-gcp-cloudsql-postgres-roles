locals {
  databases = toset(distinct(flatten([
    for role in var.roles : [role.databases_ro, role.databases_rw]
  ])))

  databases_readers = flatten([
    for role, role_ in var.roles : [
      for database in role_.databases_ro : {
        role     = role
        database = database
      }
    ]
  ])
  databases_writers = flatten(concat([
    for role, role_ in var.roles : [
      for database in role_.databases_rw : {
        role     = role
        database = database
      }
    ]
    ], [
    for database in local.databases : [
      for writer in var.legacy_writers : {
        role     = writer
        database = database
      }
    ]
  ]))

  privileges_ro = [
    "SELECT",
  ]
  privileges_rw_tables = [
    "DELETE",
    "INSERT",
    "REFERENCES",
    "SELECT",
    "TRIGGER",
    "TRUNCATE",
    "UPDATE",
  ]
  privileges_rw_sequences = [
    "DELETE",
    "INSERT",
    "SELECT",
    "TRIGGER",
    "TRUNCATE",
    "UPDATE",
  ]
}
