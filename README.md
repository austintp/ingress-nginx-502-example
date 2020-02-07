# Description

This project provides an example on how to reproduce an issue with Kubernetes ingress nginx where updating/adding  
ingress resources causes ingress routes mapped to services, of type ExternalName, to briefly respond with 502.

# Requirements

I wrote this specifically for the environment I was working in at the time. 
The following version requirements are primarily for the Deployment resource API version used.
Patch/build version doesn't really matter, this is just what I had.

1. Helm: 2.14.3
2. Kubectl / Kubernetes: 1.15.3
3. Ingress Nginx: .27.x / .26.x / .25.x / .24.x

# Setup

```
helm template -f values.yaml init/main | kubectl apply -f -
helm template -f values.yaml init/ingress-controller | kubectl apply -f -
helm template -f values.yaml platform-services/myapp | kubectl apply -f -
helm template -f values.yaml platform-services/subdomain-provisioner | kubectl apply -f -
```

# Reproducing the issue

A new Ingress rule can be added by running: 

```
kubectl exec -it -n myapp subdomain-provisioner... -- sh
./provision-subdomain.sh test1
```

You can then setup a basic watch monitor on test1.myapp.com (I added myapp.com, test1.myapp.com, testn+1.myapp.com to my hosts file).

Then use the provision-subdomain.sh script to provision two or three more tenants/subdomains and see test1.myapp.com return back 502s briefly.