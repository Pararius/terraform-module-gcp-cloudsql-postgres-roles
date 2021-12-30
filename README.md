# Terraform module to manage postgres roles

See [examples/](examples/) for some examples:
* [simple](examples/simple): Bare minimum; can also be used to quickly check impact of changes made to module
* [full](examples/full): Complete example, including provisioning of GCP CloudSQL instance

NOTE: Using this module requires a two step approach using separate `terraform apply` runs:
* Provision the postgres instance itself
* Configure the `postgres` provider and provision (additional) roles using this module
