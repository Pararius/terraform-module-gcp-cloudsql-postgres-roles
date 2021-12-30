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
  databases_writers = flatten([
    for role, role_ in var.roles : [
      for database in role_.databases_rw : {
        role     = role
        database = database
      }
    ]
  ])

  privileges_ro = [
    "SELECT",
  ]
  privileges_rw = [
    "DELETE",
    "INSERT",
    "REFERENCES",
    "SELECT",
    "TRIGGER",
    "TRUNCATE",
    "UPDATE",
  ]
}
