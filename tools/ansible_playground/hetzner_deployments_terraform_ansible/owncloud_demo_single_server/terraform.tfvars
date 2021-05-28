## ATTENTION: any variable_name defined here overrides the respective environment variable TF_VAR_variable_name

# hcloud_token = "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"

# machine_name = "terraform-owncloud-test-server"
# image = "ubuntu-20.04"
# server_type = "cx11"

## owner tag. used as praefix for machine name
#owner_tag = "gl"

## ssh key names
key_names = ["gleikam", "jw@owncloud.com"]

## machine labels
labels = {
  owner:"jw",			# FIXME: var.owner_tag is not allowed here
  usedfor:"terraformtesting",
  madewith:"terraform"
}
