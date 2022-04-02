#!/bin/bash

ehco -e "NOTICE: Please make sure your location is client-node.\n"

echo "/* Helm */"

echo "1. Get Helm installation file"
# download: https://github.com/helm/helm/releases/tag/v3.7.1
# For Linux amd64
wget https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz

echo "2. Helm installation"
tar -zxvf helm-v3.7.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
helm help
# The Kubernetes package manager
# Common actions for Helm: ...

echo "/* Kustomize */"

echo "1. Get Kustomize installation file"
# download: https://github.com/kubernetes-sigs/kustomize/releases/tag/kustomize%2Fv3.10.0
# For Linux amd64
wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.10.0/kustomize_v3.10.0_linux_amd64.tar.gz

echo "2. Kustomize installation"
tar -zxvf kustomize_v3.10.0_linux_amd64.tar.gz
sudo mv kustomize /usr/local/bin/kustomize
kustomize help
# Manages declarative configuration of Kubernetes.
# See https://sigs.k8s.io/kustomize ...

echo "/* Local Path Provisioner */"
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.20/deploy/local-path-storage.yaml
kubectl -n local-path-storage get pod
kubectl patch storageclass local-path  -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl get sc
