#!/usr/bin/env bash

# Script to automate setup of Github SSH keys
# - Generates an SSH key pair:
#   - ~/.ssh/github-prime       (private)
#   - ~/.ssh/github-prime.pub   (public)
# - Starts the SSH agent
# - Configures the SSH agent to automatically load keys
# - Prompts the user to share their public key with github 
#
# Follows documentated process from Github:
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# Prompt user for the their email
read -p "Enter your email address: " email

# Generate a new SSH keypair with an empty passphrase
# at ~/.ssh/github-prime
ssh-keygen \
  -C "${email}" \
  -f ~/.ssh/github-prime \
  -q \
  -N ""

# Start the SSH agent
eval "$(ssh-agent -s)" > /dev/null

# Modify ~/.ssh/config
# to automatically load keys
echo "

Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/github-prime

" >> ~/.ssh/config

# Add the SSH private key to ssh-agent
ssh-add -K ~/.ssh/github-prime

pubKey=$(cat ~/.ssh/github-prime.pub)

# Print the public key, and prompt the user to configure it in 
# their github account
echo "
Successfully created an SSH Key! 
But you still need to register this key with your github account.

Go to:
https://github.com/settings/ssh/new

(you may be prompted to login)

In the Title field enter: \"My Macbook Laptop\"
For the Key field, copy and paste the following text:

${pubKey}

Then press the \"Add SSH Key\" button. And you're done!
";

