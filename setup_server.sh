#!/bin/bash

##############################################
# Docker                                     #
##############################################

echo "Install Docker"

#install docker
sudo apt install docker.io docker-compose

#enable docker on reboot
sudo systemctl enable --now docker

##############################################
# Firewall                                   #
##############################################

echo "Setup Firewall"

#setup firewall for ssh/http/https
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

##############################################
# Traefik - Reverse Lookup                   #
##############################################

echo "Setup traefik"

mkdir -p ~/traefik
cp traefik/traefik.yml ~/traefik/traefik.yml
touch ~/traefik/acme.json
chmod 600 ~/traefik/acme.json
cp traefik/docker-compose.yml ~/traefik/docker-compose.yml
docker network create proxy

DIR=$PWD
cd ~/traefik
docker-compose up -d
cd $DIR

##############################################
# Portainer - Controlling Container          #
##############################################

echo "Setup Portainer"

mkdir -p ~/portainer
mkdir -p ~/portainer/data
cp portainer/docker-compose.yml ~/portainer/docker-compose.yml

DIR=$PWD
cd ~/portainer
docker-compose up -d
cd $DIR



