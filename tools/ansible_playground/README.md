## Usage

Required variables

    export TF_VAR_hcloud_token=$HCLOUD_TOKEN

Optional variables

    export TF_LOG=trace
    export TF_VAR_owner_tag=jw
    export TF_VAR_machine_name=tf-oc1070-test-$(date +%Y%m%d)

Deploy, use and shutdown

```
cd hetzner_deployments_terraform_ansible/owncloud_demo_single_server
terraform init
terraform apply --auto-approve
firefox http://$(terraform output -raw owncloud_server_ip)
terraform destroy
```

More details see:

* https://www.terraform.io/docs/language/values/variables.html
* https://www.terraform.io/docs/cli/config/environment-variables.html
