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
aptQ install -y x2goserver x2goserver-xsession firefox
adduser testy --gecos "" --disabled-password
mkdir ~testy/.ssh
cp .ssh/authorized_keys ~testy/.ssh/
chown -R testy. ~testy/.ssh
chmod 700 /home/testy/.ssh
# Add testy to sudoers. Group sudo does not work, it asks for a password which we don't have.
echo "testy ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/testy

if [ -S "$XDG_RUNTIME_DIR/bus" ]; then
  # Avoid silly firefox snap error: /user.slice/user-1000.slice/session-1.scope is not cgroup
  # The original value does not work: unix:abstract=/tmp/dbus-BaDXy43fk3,guid=d592fd877e5484036b9090ad6436d879
  export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
  echo export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" >> ~/.profile
fi

echo "Now reboot... and connect with x2goclient"
echo "	Host: $IPADDR"
echo "	User: testy"
echo "	with same ssh-key as user root"
echo "Remove black borders from window decoration:"
echo "  Control Center -> Windows -> Composting Manager -> [x] disable composting"

