#!/bin/bash

# URL script welcome.sh
WELCOME_SCRIPT_URL="https://raw.githubusercontent.com/smdbngkt/vpsku/main/welcome.sh"
WELCOME_SCRIPT_PATH="$HOME/welcome.sh"

# Download script welcome.sh
echo "Downloading welcome.sh from $WELCOME_SCRIPT_URL..."
curl -o $WELCOME_SCRIPT_PATH $WELCOME_SCRIPT_URL

# Make it executable
chmod +x $WELCOME_SCRIPT_PATH

# Add to .bashrc to run on login
echo "Running welcome.sh on login..."
echo "$WELCOME_SCRIPT_PATH" >> ~/.bashrc

echo "Installation complete. Welcome script will run on next login."
