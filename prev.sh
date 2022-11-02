# Update packages list and update system
sudo apt-get update
sudo apt upgrade -y

#Install Git
sudo apt-get install git

#Clone Repository
git clone https://github.com/alozan/debian_install.git
cd debian-install
sudo ./install.sh
