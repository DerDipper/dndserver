#!/bin/bash

usage()
{
	echo "Usage $0 -n name -g game_url -p game_port"
	exit 1
}

while getopts g:n:p:h flag
do
	case "${flag}" in
		h) usage;;
		n) name=${OPTARG};;
		p) port=${OPTARG};;
		g) game=${OPTARG};;
		?) usage
	esac
done

sudo adduser $name
sudo usermod -aG sudo $name
sudo usermod -aG docker $name

sudo mkdir -p /home/$name/foundry
sudo chown $name:$name /home/$name/foundry
sudo mkdir -p /home/$name/foundrydata
sudo chown $name:$name /home/$name/foundrydata
sudo mkdir -p /home/$name/foundrydl
sudo chown $name:$name /home/$name/foundrydl

sudo cp foundry/docker-compose.yml /home/$name/foundry/docker-compose.yml
sudo chown $name:$name /home/$name/foundry/docker-compose.yml
sudo mkdir -p /home/$name/foundrydata/Config
sudo chown $name:$name /home/$name/foundrydata/Config
sudo cp foundry/options.json /home/$name/foundrydata/Config/options.json
sudo chown $name:$name /home/$name/foundrydata/Config/options.json

sudo chmod 777 -R /home/$name/foundrydata
sudo chmod 777 -R /home/$name/foundrydl

sudo sed -i "s/§§USER§§/$name/g" /home/$name/foundry/docker-compose.yml
sudo sed -i "s/§§PORT§§/$port/g" /home/$name/foundry/docker-compose.yml
sudo sed -i "s/§§GAMEURL§§/$game/g" /home/$name/foundry/docker-compose.yml

sudo sed -i "s/§§PORT§§/$port/g" /home/$name/foundrydata/Config/options.json



