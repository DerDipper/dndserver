#!/bin/bash

##############################################
# Docker                                     #
##############################################

echo "Install Docker"

#install docker
sudo apt install apache2-utils docker.io docker-compose

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

mkdir ~/traefik
cp traefik/traefik.yml ~/traefik/traefik.yml
touch ~/traefik/acme.json
chmod 600 ~/acme.json
cp traefik/docker-compose.yml ~/traefik/docker-compose.yml
docker network create proxy
docker-compose up -d

##############################################
# Portainer - Controlling Container          #
##############################################

echo "Setup Portainer"

mkdir ~/portainer
mkdir ~/portainer/data
cp portainer/docker-compose.yml ~/portainer/docker-compose.yml
docker-compose up -d




