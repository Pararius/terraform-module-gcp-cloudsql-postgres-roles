# Terraform module to manage postgres roles

See [examples/](examples/) for some examples:
* [simple](examples/simple): Bare minimum; can also be used to quickly check impact of changes made to module
* [full](examples/full): Complete example, including provisioning of GCP CloudSQL instance

NOTE: Using this module requires a two step approach:
* Provision the postgres instance itself
* Provision (additional) roles using this module
These two steps can't be performed in a single `terraform` run.
