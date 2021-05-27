terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.25.2"
    }
  }
}

variable "hcloud_token" {}

provider "hcloud" {
  token = "${var.hcloud_token}"
}

data "hcloud_ssh_key" "mykey" {
  name = "gleikam"
}
variable "labels" {
  type = map
  default = {
    owner:"gleikam",
    usedfor:"terraformtesting"
    }

}

resource "hcloud_network" "network" {
  name = "gl-terraform-test-network"
  ip_range = "10.0.0.0/16"
  labels = "${var.labels}"
}

resource "hcloud_network_subnet" "subnet" {
  ip_range = "10.0.0.0/24"
  network_id = hcloud_network.network.id
  network_zone = "eu-central"
  type = "cloud"
}

resource "hcloud_server" "owncloud_server" {
  name        = "gl-terraform-owncloud-test-server"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  ssh_keys = [ "${data.hcloud_ssh_key.mykey.id}" ]
  labels = "${var.labels}"
  network {
    network_id = hcloud_network.network.id
    ip = "10.0.0.2"
    alias_ips  = [
      "10.0.0.5",
      "10.0.0.6"
    ]
  }
  depends_on = [
    hcloud_network_subnet.subnet
  ]
  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
    }
  }
  provisioner "local-exec" {
    command = "echo ${self.ipv4_address} > hosts"
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --extra-vars 'target=${self.ipv4_address}' install_owncloud.yml"
  }
}

resource "hcloud_server" "mysql_server" {
  name        = "gl-terraform-mysql-test-server"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  ssh_keys = [ "${data.hcloud_ssh_key.mykey.id}" ]
  labels = "${var.labels}"
  network {
    network_id = hcloud_network.network.id
    ip = "10.0.0.3"
    alias_ips  = [
      "10.0.0.7",
      "10.0.0.8"
    ]
  }
  depends_on = [
    hcloud_network_subnet.subnet
  ]
}

resource "hcloud_server" "redis_server" {
  name        = "gl-terraform-redis-test-server"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  ssh_keys = [ "${data.hcloud_ssh_key.mykey.id}" ]
  labels = "${var.labels}"
  network {
    network_id = hcloud_network.network.id
    ip = "10.0.0.4"
    alias_ips  = [
      "10.0.0.9",
      "10.0.0.10"
    ]
  }
  depends_on = [
    hcloud_network_subnet.subnet
  ]
}

output "owncloud_server_ip" {
  value = hcloud_server.owncloud_server.ipv4_address
  depends_on = [
    hcloud_server.owncloud_server
  ]
}
output "owncloud_server_internal_ip" {
  value = hcloud_server.owncloud_server.network
  depends_on = [
    hcloud_server.owncloud_server
  ]
}
output "mysql_server_ip" {
  value = hcloud_server.mysql_server.ipv4_address
  depends_on = [
    hcloud_server.mysql_server
  ]
}
output "redis_server_ip" {
  value = hcloud_server.redis_server.ipv4_address
  depends_on = [
    hcloud_server.redis_server
  ]
}