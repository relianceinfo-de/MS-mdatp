#!/bin/bash

# Update the system and install necessary dependencies
sudo yum -y update
sudo yum -y install epel-release

# Install Ansible
sudo yum -y install ansible

# Verify the installation
ansible --version

# Output success message
echo "Ansible has been successfully installed on your Red Hat-based server."
