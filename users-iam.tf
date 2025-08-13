resource "google_sql_user" "iam" {
  for_each = local.roles_iam

  instance = var.instance_id
  name     = each.key
  type     = each.value.type
}
