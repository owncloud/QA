provider "hcloud" {
  token   = "${var.hcloud_token}"
  version = "~> 1.10"
}

