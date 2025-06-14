#!/bin/bash

# Update system
sudo apt-get update
sudo apt-get upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Create app directory
sudo mkdir -p /var/www/buzzer
sudo cp -r * /var/www/buzzer/
cd /var/www/buzzer

# Install dependencies
npm install

# Start the application with PM2
pm2 start index.js --name "buzzer"
pm2 save
pm2 startup

# Set up Nginx
sudo apt-get install -y nginx
sudo tee /etc/nginx/sites-available/buzzer << EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:4000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Enable the site
sudo ln -s /etc/nginx/sites-available/buzzer /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx

echo "Deployment complete! Your buzzer system should be running at http://your-server-ip" 