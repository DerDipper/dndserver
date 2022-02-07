#!/bin/bash

sudo adduser $1
sudo usermod -aG sudo $1
sudo usermod -aG docker $1

if [ "$2" = "-game" ]; then
echo "is DM"
sudo mkdir -p /home/$1/foundry
sudo chown $1:$1 /home/$1/foundry
sudo mkdir -p /home/$1/foundrydata
sudo chown $1:$1 /home/$1/foundrydata
sudo mkdir -p /home/$1/foundrydl
sudo chown $1:$1 /home/$1/foundrydl

sudo cp foundry/docker-compose.yml /home/$1/foundry/docker-compose.yml
sudo chown $1:$1 /home/$1/foundry/docker-compose.yml
sudo mkdir -p /home/$1/foundrydata/Config
sudo chown $1:$1 /home/$1/foundrydata/Config
sudo cp foundry/options.json /home/$1/foundrydata/Config/options.json
sudo chown $1:$1 /home/$1/foundrydata/Config/options.json

fi

