#!/bin/bash
sudo yum update -y && sudo yam install -y docker
sudo systemctl start docker
sudo username -aG docker ec2-user
docker run -p 8080:80 nginx