#!/bin/bash

# This script uses the convenience script for installing Docker CE
# for linux Ubuntu distributions as specified on 
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
# as of 2018-08-17 [yyyy-mm-dd] (1).

# It then does necessary group and user modifications in order to
# allow docker to be run without root access (2).

# Warning: Do not run if Docker is already installed.

# 1

echo "Download auto install script"
curl -fsSL https://get.docker.com -o get-docker.sh

echo "Run auto install script"
sudo sh get-docker.sh

# 2

echo "Create a group called docker"
sudo groupadd docker

echo "Add current (non-root) user to the group docker"
sudo usermod -aG docker $USER

# a log out and log in is at the current statium necessary to re-evaluate user memberships (which is necessary to do to get Docker working without sudo).
# Since you don't want to do this, a workaround is (https://superuser.com/questions/272061/reload-a-linux-users-group-assignments-without-logging-out)
# the following:

echo "Get the id of current group and store it for later use"
MY_USER_ID=$(id -g)

echo "Switch to the docker group as primary for the (non-root) user"
newgrp docker

echo "Switch back to the original group, using the group id previously returned by id -g and stored"
newgrp $MY_USER_ID

echo "You should now be able to run Docker as non-root without first performing a re-login"

