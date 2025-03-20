# Architecture

![alt text](<AKS Architecture.jpg>)

# Create ssh key

Create ssh key and update public key to [variable "publicKey"] in variables.tf

```
ssh-keygen -t rsa -f aks_key
```

# Install Az cli

```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

# Install kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f ./kubectl
```

# Login Azure

```
az login
```

# Deploy AKS Cluster

```
terraform init
terraform validate
terraform apply --auto-approve
```

# Deploy apps to AKS Cluster
Update variables in configmap.yaml and secrets.yaml to meet your requirements

## Deploy secrets, configmap, services

```
kubectl apply -f secrets.yaml
kubectl apply -f configmap.yaml
kubectl apply -f services.yaml
```

## Deploy DBs

```
kubectl apply -f dbs.yaml
```

## Deploy backends

```
kubectl apply -f backends.yaml
```

## Deploy backends

```
kubectl apply -f frontend.yaml
```

## Install NGINX Ingress

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml
```
## Edit configmapp
Update REACT_APP_RECIPE_API_URL & REACT_APP_API_URL to NGINX ingress public IP

```
kubectl edit configmap/app-config
```