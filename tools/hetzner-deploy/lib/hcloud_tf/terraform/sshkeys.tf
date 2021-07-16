resource "hcloud_ssh_key" "default" {
  count = "${length(var.ssh_keys)}"

  name       = "${element(split(" ", element(var.ssh_keys, count.index)), 2)}"
  public_key = "${element(split(" ", element(var.ssh_keys, count.index)), 0)} ${element(split(" ", element(var.ssh_keys, count.index)), 1)}"
}
