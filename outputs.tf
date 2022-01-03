output "passwords" {
  sensitive = true
  value     = { for role, password in random_password.role : role => password.result }
}
