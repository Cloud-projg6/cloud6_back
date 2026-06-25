#!/bin/bash
JAR=$(find /home/ec2-user/app -maxdepth 2 -name "*.jar" | grep -v original | head -n1)

cat > /etc/systemd/system/bookapp.service <<EOF
[Unit]
Description=bookapp
After=network.target

[Service]
User=root
WorkingDirectory=/home/ec2-user/app
ExecStart=/usr/bin/java -jar $JAR --server.port=8080
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable bookapp
systemctl restart bookapp
exit 0