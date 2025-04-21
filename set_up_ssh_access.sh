#!/bin/bash
echo "About to Create SSH For $username with Public Key : $public_key"

# Add the user
sudo adduser --disabled-password --gecos "" "$username"
if [ $? -ne 0 ]; then
  echo "Error: Failed to create user '$username'."
  exit 1
fi

# Add the user to the sudo group
echo "Adding '$username' to the sudo group..."
sudo usermod -aG sudo "$username"
if [ $? -ne 0 ]; then
  echo "Error: Failed to add '$username' to the sudo group."
  exit 1
fi

# Set up SSH access
echo "Setting up SSH access for '$username'..."
SSH_DIR="/home/$username/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

sudo mkdir -p "$SSH_DIR"
sudo chmod 700 "$SSH_DIR"

echo "$public_key" | sudo tee "$AUTHORIZED_KEYS" > /dev/null
sudo chmod 600 "$AUTHORIZED_KEYS"
sudo chown -R "$username:$username" "$SSH_DIR"

if [ $? -eq 0 ]; then
  echo "SSH access has been successfully set up for '$username'."
else
  echo "Error: Failed to set up SSH access for '$username'."
  exit 1
