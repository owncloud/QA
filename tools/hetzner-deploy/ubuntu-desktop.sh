export DEBIAN_FRONTEND=noninteractive	# try prevent ssh install to block wit whiptail
export LC_ALL=C LANGUAGE=C
aptQ() { echo "+ apt $@"; apt "$@" 2>&1 | stdbuf -o0 tr ] '\n' | grep -E -v "^(Preparing to|Get:|Selecting previously unselected|^WARNING: apt does not have|Creating config|Created symlink|Processing triggers|^Fetched |^Setting up |^Need to |^After this |^\s*\(Reading |^Reading |^Building|^\$|^0 upgraded, )"; test ${PIPESTATUS[0]} -eq 0; }

aptQ update
aptQ upgrade -y
aptQ install -y software-properties-common
aptQ install -y x11vnc ubuntu-mate-desktop	# ca 2GB of packages
apt purge -y mate-power-manager	# it crashes on a VM
systemctl set-default graphical

# recommended by /home/testy/HOWTO/remote-desktop-sharing.txt
aptQ install -y x2goserver x2goserver-xsession
adduser testy --gecos "" --disabled-password
mkdir ~testy/.ssh
cp .ssh/authorized_keys ~testy/.ssh/
chown -R testy. ~testy/.ssh
chmod 700 /home/testy/.ssh
# TODO: add testy to sudoers.

echo "Now reboot... and connect with x2goclient"
echo "	Host: $IPADDR"
echo "	User: testy"
echo "	with same ssh-key as user root"

