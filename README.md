# Jeopardy Buzzer System

A real-time buzzer system for Jeopardy-style games, built with Node.js and Socket.IO.

## Local Development

1. Install dependencies:
```bash
npm install
```

2. Start the development server:
```bash
npm run dev
```

3. Access the application:
- Host dashboard: http://localhost:4000/host.html
- User buzzer: http://localhost:4000/user.html

## Deploying to DigitalOcean

### Prerequisites
1. A DigitalOcean account
2. A domain name (optional)

### Deployment Steps

1. Create a new Droplet:
   - Choose Ubuntu 22.04 LTS
   - Select a plan (Basic is fine)
   - Choose a datacenter region close to your users
   - Add your SSH key
   - Create the Droplet

2. Connect to your Droplet:
```bash
ssh root@your-droplet-ip
```

3. Clone this repository:
```bash
git clone https://github.com/your-username/jeopardy-buzzer.git
cd jeopardy-buzzer
```

4. Make the deployment script executable and run it:
```bash
chmod +x deploy.sh
./deploy.sh
```

5. Your buzzer system should now be running at:
   - Host dashboard: http://your-droplet-ip/host.html
   - User buzzer: http://your-droplet-ip/user.html

### Optional: Setting up a Domain

1. Add an A record in your domain's DNS settings pointing to your Droplet's IP address

2. Update the Nginx configuration:
```bash
sudo nano /etc/nginx/sites-available/buzzer
```

3. Replace `server_name _;` with your domain:
```
server_name your-domain.com www.your-domain.com;
```

4. Restart Nginx:
```bash
sudo systemctl restart nginx
```

### Maintenance

- View logs: `pm2 logs buzzer`
- Restart the application: `pm2 restart buzzer`
- Stop the application: `pm2 stop buzzer`
- Start the application: `pm2 start buzzer`

## Security Considerations

- The application runs on port 4000 internally but is proxied through Nginx on port 80
- WebSocket connections are properly handled through the Nginx proxy
- The application is managed by PM2 for process management and automatic restarts
