#!/bin/bash

##############################################
# Docker                                     #
##############################################

#install docker
sudo apt install apache2-utils docker.io docker-compose

#enable docker on reboot
sudo systemctl enable --now docker

##############################################
# Firewall                                   #
##############################################

#setup firewall for ssh/http/https
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

sudo usermod -aG docker $USER
newgrp docker

##############################################
# Traefik - Reverse Lookup                   #
##############################################

mkdir ~/traefik
mv traefik/traefik.yml ~/traefik/traefik.yml
touch ~/traefik/acme.json
chmod 600 acme.json
mv traefik/docker-compose.yml ~/traefik/docker-compose.yml
docker network create proxy
docker-compose up -d

##############################################
# Portainer - Controlling Container          #
##############################################

mkdir ~/portainer
mkdir ~/portainer/data
mv portainer/docker-compose.yml ~/portainer/docker-compose.yml
docker-compose up -d




