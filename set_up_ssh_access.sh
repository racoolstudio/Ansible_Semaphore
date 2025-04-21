#!/bin/bash
echo "About to Create SSH For $username with Public Key : $public_key"
sudo add $username
echo "Adding $username to Sudo group"
sudo usermod -aG sudo $username

echo "Setting Up SSH Access"
sudo mkdir -p "/home/$username/.ssh"
sudo chmod 700 "/home/$username/.ssh"

echo "$public_key" | sudo tee "/home/$username/.ssh/authorized_keys"
sudo chmod 600 "/home/$username/.ssh/authorized_keys"
sudo chown -R "$username:$username" "/home/$username/.ssh"
