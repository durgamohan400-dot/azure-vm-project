git pull origin main
sudo cp index.html /var/www/html/index.html
sudo systemctl restart nginx

#!/bin/bash
set -e

cd ~/azure-vm-project
git pull origin main
sudo docker stop my-web-app || true
sudo docker rm my-web-app || true
sudo docker build -t my-web-app .
sudo docker run -d --name my-web-app -p 80:80 my-web-app
