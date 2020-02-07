#!/bin/sh

helm template \
  --set host=$K8S_HOSTNAME \
  --set-string tenant=$1 \
  subdomain-templates | kubectl apply -f -