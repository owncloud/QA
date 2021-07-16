# Hetzner Deployment Scripts

The tools here can deploy ocis and other installations into Hetzner cloud (or anywhere with root access).
At Hetzner we use terraform or the hcloud API commands to create the machine. The machines will be made accessible via ssh.

Not tested on Mac. (Pull requests welcome)

## Example with full automation

* Have access to a project at https://console.hetzner.cloud (invitation accepted)
* Have a hcloud API token for the project project.
* Have your public ssh key uploaded into the project. Below use the name of your ssh-key instead of `jw@owncloud.com`
* Run from your local Ubuntu machine:

```
sudo apt install git
git clone https://github.com/owncloud-docker/compose-playground
cd compose-playground/examples/hetzner-deploy

export HCLOUD_SSHKEY_NAMES=jw@owncloud.com
export HCLOUD_TOKEN=mZdZX......................................................L8bml
./make_oc10_apps.sh --
```

## Simple example with manually created machine

* Create a machine, e.g. at https://console.hetzner.cloud/projects, record its IP-address. Used below.
* Make sure that you can login as root with ssh. If needed accept hostkeys and fingerprints.
* Run from your local Ubuntu machine:

```
sudo apt install git
git clone https://github.com/owncloud-docker/compose-playground
cd compose-playground/examples/hetzner-deploy

export OC_DEPLOY_ADDR=xx.yy.zz.aa
./make_ocis_test.sh
```


## Example with manually created machine and doing everything there

* Create a machine, e.g. at https://console.hetzner.cloud/projects, record its IP-address.
* Login as root with ssh there.
* Run from within that machine:

```
apt install git
git clone https://github.com/owncloud-docker/compose-playground
cd compose-playground/examples/hetzner-deploy

export OC_DEPLOY_ADDR=localhost
./make_ocis_test.sh
```

## Scripts

All these scripts are independant entry points. Each of them deploys a specific setup
and gives some instruction for what to do next.

 * `env OCIS_VERSION=v1.0.0-beta5 ./make_ocis_eos_compose_test.sh` -- run ocis (with specified git branch) on eos.

 * `./make_ocis_eos_compose_test.sh` -- run ocis with eos as docker compose. Jürgen's favorite entry point.

 * `./make_ocis_make_generate_build_test.sh` -- build ocis from source, and run the binary (without docker)

 * `./make_machine.sh` -- creates a machine and returns its IP address.
   This is a general purpose script, check out the command line options.
   In case of OC_DEPLOY_ADDR=localhost, an attempt is made to return the IP address associated with the default route.
   The other scripts are actually wrappers on this one. Read and modify them. (But don't read make_machine.sh -- it does magic).

In each case, wait several minutes, until the setup is done.
Follow the instructions on screen.

You can tear down a Hetzner machines either from https://console.hetzner.cloud, or by using the command line.
In both cases, you will be prompted with the machine name again, and will have to confirm.

  * `./destroy_machine.sh MACHINE_NAME` -- destroy one specific machine.

  * `./destroy_machine.sh "$USER-*"` -- destroy all machines prefixed with my user name. At the prompts you can say `yes` or `no` to select which ones to actually destroy.
  .
  * `./destroy_machine.sh` -- without parameters, it returns a listing of running machines that were made with terraform.

