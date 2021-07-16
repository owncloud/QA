resource "hcloud_server" "server" {
  count      = "${length(var.server_names)}"
  depends_on = ["hcloud_ssh_key.default"]

  name        = "${element(var.server_names, count.index)}"
  server_type = "${element(var.server_types, count.index)}"
  image       = "${var.server_image}"
  datacenter  = "${var.server_datacenter}"
  ssh_keys    = "${var.server_keys}"
  backups     = true
  labels      = {
    owner     = "${var.server_owner}"
    origin    = "${var.server_origin}"
    used_for  = "${var.server_used_for}"
  }

  lifecycle {
    ignore_changes = ["ssh_keys"]
  }
}
