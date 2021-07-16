variable "hcloud_token" {
  type = "string"
}

variable "server_names" {
  type = "list"

  default = [
    "jw-test"
  ]
}

variable "server_types" {
  type = "list"

  default = [
    "cx21",
  ]
}

variable "server_image" {
  type    = "string"
  default = "ubuntu-20.04"
}

variable "server_datacenter" {
  type    = "string"
  default = "fsn1-dc14"
#  default = "nbg1-dc3"
}

variable "server_origin" {
  type    = "string"
  default = "tf_make_machine_sh"
}

variable "server_used_for" {
  type    = "string"
  default = "server_testing"
}

variable "server_owner" {
  type    = "string"
  default = "anonymous_user_of_compose_playground_hetzner_deploy"
}

variable "server_keys" {
  type = "list"

  default = [
#    "jw@owncloud.com",
  ]
}

variable "ssh_keys" {
  type = "list"

  default = [
  ]
}
