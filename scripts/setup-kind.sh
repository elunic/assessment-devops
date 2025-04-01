#!/bin/bash
set -e

# Install additional tools for debugging
sudo apt-get update
sudo apt-get install -y \
    jq \
    net-tools \
    iputils-ping \
    dnsutils \
    netcat-openbsd \
    tcpdump \
    traceroute \
    curl \
    wget \
    vim \
    htop

# Install KIND (Kubernetes in Docker)
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Verify KIND installation
echo "KIND version:"
kind version

echo "KIND environment setup completed successfully" 
