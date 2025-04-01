FROM ubuntu:22.04 AS base

RUN apt-get update \
    && apt-get install -y \
        bash-completion \
        curl \
        git \
        nano \
        python3 \
        unzip \
        wget \
        zip \
    && rm -rf /var/lib/apt/lists/*

# Terraform CLI
ARG TERRAFORM_VERSION
RUN wget -q -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip -q /tmp/terraform -d /tmp \
  && mv /tmp/terraform /usr/local/bin/terraform \
  && rm -f /tmp/terraform.zip

# Hetzner Cloud CLI
ARG HCLOUD_VERSION
RUN apt-get update \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        zsh \
        lsb-release \
        gnupg \
    && curl -L https://github.com/hetznercloud/cli/releases/download/v${HCLOUD_VERSION}/hcloud-linux-amd64.tar.gz | tar -xzf - \
    && mv hcloud /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/*

ARG KUBECTL_VERSION
RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/kubectl

# We need a real home directory to mount kubectl config folders
RUN useradd --shell /bin/bash --uid 1000 -m application

RUN mkdir /app/ \
    && mkdir /app/devops-challenge/ \
    && chown -R application:application /app/


##
FROM base AS dockershell

USER 1000


## Default fallback
FROM dockershell
