hcloud_token = "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"

machine_name = "terraform-owncloud-test-server"
image = "ubuntu-20.04"
server_type = "cx11"

#owner tag. used as praefix for machine name
owner_tag = "gl"

#ssh key names
key_names = ["gleikam", "jw@owncloud.com"]

#machine labels
labels = {
  owner:"gleikam",
  usedfor:"terraformtesting",
  madewith:"terraform"
}
