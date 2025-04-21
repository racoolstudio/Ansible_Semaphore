#!/bin/bash

USERNAME=$1
PUBKEY=$2

# Validate input
if [ -z "$USERNAME" ] || [ -z "$PUBKEY" ]; then
  echo "Error: Username or Public Key is missing."
  exit 1
fi

# Create the user and set up SSH access
useradd -m -s /bin/bash "$USERNAME"
mkdir -p /home/"$USERNAME"/.ssh
echo "$PUBKEY" > /home/"$USERNAME"/.ssh/authorized_keys
chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"/.ssh
chmod 600 /home/"$USERNAME"/.ssh/authorized_keys
chmod 700 /home/"$USERNAME"/.ssh
echo "SSH access set up for $USERNAME."
