# Update packages list and update system
sudo apt-get update
sudo apt upgrade -y

#Clone Repository
git clone https://github.com/alozan/debian_install.git
cd debian-install
sudo ./install.sh
