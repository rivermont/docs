# APT
sudo apt update
sudo apt full-upgrade

# Dependencies for i3-gaps
sudo apt install build-essential
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev
sudo add-apt-repository ppa:aguignard/ppa
sudo apt update
sudo apt install libxcb-xrm-dev

# Download, compile and install i3-gap
cd /home/rivermont
git clone git://github.com/Airblader/i3
cd i3
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# Install xorg
sudo apt install xinit

sudo reboot
