#! /usr/bin/python3
#
# hcloud_py/make_machine.py -- a rewrite of hcloud_tf/make_machine.sh without using terraform.
# (C) 2020 jw@owncloud.com -- distribute under GPLv2 or ask.
#
# We want to make the HCLOUD_SSHKEY_NAMES varible obsolete.
# This can be done by checking $HOME/.ssh/ for existing private/public key pairs.
# The public key of an existing pair could then be added to the newly created machine.
# This technique is more reliably (and less cumbersome) than uploading and naming correct keys 
# with HCLOUD_SSHKEY_NAMES. Hcloud maintains keys per project. You need to re-upload when switching projects.
#
# With terraform, we support an aditional HCLOUD_SSHKEY variable, where such a private key can be 
# specified. Its use is however discouraged, and cannot reliably be automated, as terraform fails, if we specfy a key
# that was already uploaded. Also with terraform there is no way to inspect uploaded keys and avoid sich conflicts.

# See also:
#  https://hcloud-python.readthedocs.io/en/latest/
#  https://github.com/hetznercloud/hcloud-python/tree/master/examples
#
# Requires:
#  sudo -H pip3 install hcloud
#
import os, sys, string, random, base64, hashlib, argparse, subprocess

from hcloud import Client
from hcloud.images.domain import Image
from hcloud.ssh_keys.domain import SSHKey
from hcloud.server_types.domain import ServerType
from hcloud.images.client import ImagesClient

hcloud_api_token = os.environ.get('HCLOUD_TOKEN')
if hcloud_api_token == None:
  print("Environment variable HCLOUD_TOKEN not set.", file=sys.stderr)
  sys.exit(1)

ssh_key_names = os.environ.get('HCLOUD_SSHKEY_NAMES', '')
server_image = os.environ.get('HCLOUD_SERVER_IMAGE')
if server_image == None:
  server_image = "ubuntu-20.04"

datacenter = "fsn1-dc14"
server_type = "cx11"
used_for = "server_testing"
debug = False

parser = argparse.ArgumentParser(description=sys.argv[0]+" V0.2")
parser.add_argument('-i', '--image',          type=str, default=server_image, help="server image. Default: "+server_image)
parser.add_argument('-t', '--type',           type=str, default=server_type, help="server type. Default: "+server_type)
parser.add_argument('-d', '--datacenter',     type=str, default=datacenter, help="server datacenter. Default: "+datacenter)
parser.add_argument('-s', '--ssh-key-names',  type=str, help="comma-separated names of uploaded public keys. Default: env HCLOUD_SSHKEY_NAMES", default=ssh_key_names)
parser.add_argument('-p', '--packages',       type=str, help="comma-separated list of linux packages to install")
parser.add_argument('-u', '--unique',         type=str, help="make name unique by prepending user and appending a suffix")
parser.add_argument('-n', '--name',           type=str, help="specify machine name. Default: from image name")
parser.add_argument('-l', '--login',          action='store_true', help="ssh into the machine, when ready")
parser.add_argument('-f', '--used-for',       action='store_true', default=used_for, help="label with purpose of machine. Default: "+used_for)
parser.add_argument('PARAM', nargs='*', help="optional parameters")
args = parser.parse_args()
NAME = args.name
if args.unique:
   NAME = args.unique

used_for = args.used_for
if not NAME: NAME = args.image
NAME = NAME.translate( { ord('.'):ord('-'), ord('_'):ord('-') } )       # avoid _ and . in name. Always

client = Client(token=hcloud_api_token)

if debug:
  # list all servers in this project
  for s in client.servers.get_all(): 
    sd = s.data_model
    print("%-12s" % sd.name, "%-15s" % sd.public_net.ipv4.ip if sd.public_net else None, sd.server_type.data_model.name, sd.image.name if sd.image else None, sd.created, sd.status, sd.labels, file=sys.stderr)
  
  # list all ssh-keys in this project
  for k in client.ssh_keys.get_all(): 
    kd = k.data_model
    print(kd.fingerprint, kd.created, kd.name, kd.labels, file=sys.stderr)

ssh_key_names = args.ssh_key_names.split(',') if len(args.ssh_key_names) else []
packages = args.packages.split(',') if args.packages else []

# from http://stackoverflow.com/questions/6682815/deriving-an-ssh-fingerprint-from-a-public-key-in-python
def ssh_fingerprint(str):
  key = base64.b64decode(str.encode('ascii'))
  fp_plain = hashlib.md5(key).hexdigest()
  return ':'.join(a+b for a,b in zip(fp_plain[::2], fp_plain[1::2]))

sshdir = os.environ.get('HOME')+'/.ssh/'
if not ssh_key_names:
  # match local keys with hcloud keys
  for file in [ 'id_ed25519', 'id_ecdsa', 'id_dsa', 'id_rsa' ]:
    if os.access(sshdir+file+'.pub', 0) and os.access(sshdir+file, 0):
      pub = open(sshdir+file+'.pub', 'r').read().split()
      fp = ssh_fingerprint(pub[1])
      known_key = client.ssh_keys.get_by_fingerprint(fp)
      if known_key:
        ssh_key_names.append(known_key.data_model.name)
        print("hcloud ssh-key '%s' matches '%s.pub'" % (known_key.data_model.name, sshdir+file), file=sys.stderr)
        break

ssh_pub_key = None
if not ssh_key_names:
  # grab a key from the local home. It cannot cause collisions
  for file in [ 'id_ed25519', 'id_ecdsa', 'id_dsa', 'id_rsa' ]:
    if os.access(sshdir+file+'.pub', 0) and os.access(sshdir+file, 0):
      ssh_pub_key = open(sshdir+file+'.pub', 'r').read().split()
      if len(ssh_pub_key) < 3:
        ssh_pub_key.append(os.environ.get('USER'))
      break

if not ssh_key_names and not ssh_pub_key:
  print("ERROR: env variable HCLOUD_SSHKEY_NAMES was empty, and could not find a key pair in ~/.ssh/", file=sys.stderr)
  sys.exit(1)

user = ssh_key_names[0] if ssh_key_names else ssh_pub_key[2]    # get user from key name, from local pubkey suffix, or from $USER
user = user.split('@')[0]       # strip domain part, if any
suff = ''.join(random.choice(string.ascii_lowercase+string.digits) for i in range(3))
if args.unique: NAME = '-'.join([user, NAME, suff])

labels = { 'owner': user, 'origin': 'make_machine_py', 'used_for': used_for }
ssh_key_list = []
for k in ssh_key_names:
  bk = client.ssh_keys.get_by_name(k)
  if not bk:
    print("ERROR: key name '%s' is not kowwn at hcloud" % k, file=sys.stderr)
    sys.exit(1)

  ssh_key_list.append(client.ssh_keys.get_by_name(k))

if ssh_pub_key:
  k = client.ssh_keys.create(name=ssh_pub_key[2], public_key=ssh_pub_key[0]+' '+ssh_pub_key[1])
  ssh_key_list.append(k)

def find_image(client, name):
  """ finds images, snapshots, or backups
  """
  ic = ImagesClient(client)
  for i in ic.get_all():
    if i.name == name:
      print("Using image '%s' by name, type=%s" % (name, i.type), file=sys.stderr)
      return i
  for i in ic.get_all():
    if i.description == name:
      print("Using image '%s' by descrption, type=%s" % (name, i.type), file=sys.stderr)
      return i

img = find_image(client, args.image)

if debug: print(NAME, args.type, args.image, args.datacenter, ssh_key_names, ssh_pub_key, ssh_key_list, packages, file=sys.stderr)
response = client.servers.create(name=NAME, server_type=ServerType(args.type), image=img, ssh_keys=ssh_key_list, labels=labels)
server = response.server
IPADDR = server.data_model.public_net.ipv4.ip
model = server.data_model.server_type.data_model
print("Machine created: type=%s cpus=%s mem=%sgb disk=%sgb addr=%s" % (model.name, model.cores, model.memory, model.disk, IPADDR), file=sys.stderr)

server.change_dns_ptr(IPADDR, NAME+'.hcloud.owncloud.com')       # needs an FQDN

# CAUTION: keep in sync with ../hcloud_tf/make_machine.sh
script = """
exec 1>&2	# all output goes to stderr.
server_image="%s"
IPADDR="%s"
extra_pkg="%s"
do_login="%s"

ssh-keygen -f ~/.ssh/known_hosts -R $IPADDR	# needed to make life easier later.
# StrictHostKeyChecking=no automatically adds new host keys and accepts changed host keys.

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 999 last; do
  to=5
  test "$i" -gt 10 && to=15
  sleep $to
  echo -n .
  timeout $to ssh -o ConnectTimeout=5 -o CheckHostIP=no -o StrictHostKeyChecking=no -o PasswordAuthentication=no root@$IPADDR uptime && break
  if [ "$i" = "999" ]; then
    echo "Error: cannot ssh into machine at $IPADDR -- tried multiple times."
    exit 1
  fi
done

if [ -n "$extra_pkg" ]; then
  case "$server_image" in
    ubuntu*|debian*)
      ssh root@$IPADDR sh -x -s <<END
        export LC_ALL=C
        apt-get update
        apt-get upgrade -y
        apt-get install -y $extra_pkg
END
        ;;
    fedora*|centos*)
      ssh root@$IPADDR sh -x -s <<END
        export LC_ALL=C
        yum install -y $extra_pkg
END
        ;;
    *) echo "platform installer not implemented for $server_image. Skipping package installation of $extra_pkg"
        ;;
  esac
fi

if [ "$do_login" = true ]; then
  echo "+ ssh root@$IPADDR"
  ssh root@$IPADDR
fi
exit 0
""" % (args.image, IPADDR, ' '.join(packages), "true" if args.login else "")

rc = subprocess.call(script, shell=True)
if rc != 0:
  print("ERROR: subprocess.call return code = %d" % rc, file=sys.stderr)
  sys.exit(1)

print("export IPADDR=%s NAME=%s PARAM='%s'" % (IPADDR, NAME, ' '.join(args.PARAM)))
