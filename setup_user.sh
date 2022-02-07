#!/bin/bash

sudo adduser $1
sudo usermod -aG sudo $1
sudo usermod -aG docker $1

