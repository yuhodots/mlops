#!/bin/bash

echo "/* K3s installation with docker back-end */"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.21.7+k3s1 sh -s - server --disable traefik --disable servicelb --disable local-storage --docker
sudo cat /etc/rancher/k3s/k3s.yaml

echo "/* Kubernetes cluster setup */"
mkdir .kube
sudo cp /etc/rancher/k3s/k3s.yaml .kube/config
sudo chown $USER:$USER .kube/config

echo "/* Kubernetes client setup */"
echo "Move the kubconfig in the cluster to local machine. (Please change the server address)"

echo "/* Installation check */"
kubectl get nodes -o wide
