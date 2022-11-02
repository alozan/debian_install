#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Install brave-browser
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#Install Machine Learning Apps

#Install dependencies
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

#Install Python
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz
tar -xf Python-3.10.*.tgz
cd Python-3.10.*/
./configure --enable-optimizations
make -j 4
sudo make altinstall
python3 --version

#Install Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
bash ~/Anaconda3-2022.10-Linux-x86_64.sh

#Install R
sudo apt-get update
sudo apt-get install r-base r-base-dev
sudo apt-get install libatlas3-base

#Install Neovim
sudo apt install neovim
sudo apt install python3-neovim

#Install Docker
sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#run Docker

sudo docker run hello-world