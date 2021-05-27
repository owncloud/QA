## Usage

```
export TF_VARS_hcloud_token=$HCLOUD_TOKEN
export TF_VARS_owner_tag=jw
export TF_VARS_machine_name=tf-oc1070-test-$(date +%y%m%d)

cd hetzner_deployments_terraform_ansible/owncloud_demo_single_server
terraform init
terraform apply
```
