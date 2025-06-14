#!/bin/bash

# Change to the application directory
cd /var/www/buzzer

# Pull the latest changes
git pull

# Install any new dependencies
npm install

# Restart the application
pm2 restart buzzer

echo "Update completed at $(date)" 