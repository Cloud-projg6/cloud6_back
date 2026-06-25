#!/bin/bash
echo "Installing dependencies..."
sudo yum install -y java-17-amazon-corretto lsof nginx

echo "Configuring Nginx Reverse Proxy..."
sudo mkdir -p /etc/nginx/default.d
sudo bash -c 'cat > /etc/nginx/default.d/proxy.conf <<EOF
location / {
    proxy_pass http://localhost:8080;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
}
EOF'

sudo systemctl enable nginx
sudo systemctl restart nginx

echo "Cleaning up destination directory..."
sudo rm -rf /home/ec2-user/app/*
sudo rm -rf /home/ec2-user/app/.[!.]* || true
