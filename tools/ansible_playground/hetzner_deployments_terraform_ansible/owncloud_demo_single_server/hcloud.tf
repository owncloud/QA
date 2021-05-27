terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.25.2"
    }
  }
}

variable "hcloud_token" {}
variable "owner_tag" {}
variable "labels" {}

provider "hcloud" {
  token = "${var.hcloud_token}"
}

data "hcloud_ssh_key" "mykey" {
  name = "gleikam"
}


resource "hcloud_server" "owncloud_server" {
  name        = "${var.owner_tag}-terraform-owncloud-test-server"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  ssh_keys = [ "${data.hcloud_ssh_key.mykey.id}" ]
  labels = "${var.labels}"

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



output "owncloud_server_ip" {
  value = hcloud_server.owncloud_server.ipv4_address
  depends_on = [
    hcloud_server.owncloud_server
  ]
}

