#!/bin/sh

helm template \
  --set host=$K8S_HOSTNAME \
  --set-string tenant=$1 \
  --set-string sidecar.tls_crt="$(cat /app/cert/tls.crt | base64 | tr -d '\n')" \
  --set-string sidecar.tls_key="$(cat /app/cert/tls.key | base64 | tr -d '\n')" \
  subdomain-templates | kubectl apply -f -