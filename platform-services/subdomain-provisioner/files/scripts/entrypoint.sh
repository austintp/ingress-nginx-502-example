#!/bin/sh

wget -O /tmp/helm.tar.gz 'https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz' \
&& tar -zxvf /tmp/helm.tar.gz -C /tmp \
&& mv /tmp/linux-amd64/helm /bin/helm
wget -O /tmp/kubectl 'https://storage.googleapis.com/kubernetes-release/release/v1.15.3/bin/linux/amd64/kubectl' \
&& chmod +x /tmp/kubectl \
&& mv /tmp/kubectl /bin/kubectl

while true; do sleep 1000; done