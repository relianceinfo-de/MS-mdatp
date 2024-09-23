#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install the required dependencies
sudo apt-get install -y software-properties-common

# Add the Ansible PPA (Personal Package Archive)
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt-get install -y ansible

# Verify the installation
ansible --version

# Print completion message
echo "Ansible installation is complete!"
