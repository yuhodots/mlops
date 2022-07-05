#!/bin/bash

echo "/* apt packages installation for port-forwarding */"
sudo apt-get update
sudo apt-get install -y socat

echo "/* Docker installation */"

echo "1. apt packages installation"
sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "2. Set docker GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "3. Get docker from stable Repository"
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "4. Check available docker version"
sudo apt-get update && apt-cache madison docker-ce
apt-cache madison docker-ce | grep 5:20.10.11~3-0~ubuntu-focal

echo "5. Install docker: 5:20.10.11~3-0~ubuntu-focal"
sudo apt-get install -y containerd.io docker-ce=5:20.10.11~3-0~ubuntu-focal docker-ce-cli=5:20.10.11~3-0~ubuntu-focal

echo "6. Check that the docker is properly installed"
sudo docker run hello-world
# Hello from Docker!
# This message shows that your installation appears to be working correctly...

echo "7. Authorization"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "/* Turn off Swap Memory */"
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a

echo "/* Kubectl installation */"

echo "1. Curl kubectl v1.21.7"
curl -LO https://dl.k8s.io/release/v1.21.7/bin/linux/amd64/kubectl

echo "2. Change the permissions and location of the file"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "3. Check that kubectl is properly installed"
kubectl version --client
