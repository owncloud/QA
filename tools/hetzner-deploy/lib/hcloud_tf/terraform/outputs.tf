output "ipv4" {
  value = "${join(" ", hcloud_server.server.*.ipv4_address)}"
}

output "ipv6" {
  value = "${join(" ", hcloud_server.server.*.ipv6_address)}"
}

output "name" {
  value = "${join(" ", hcloud_server.server.*.name)}"
}
