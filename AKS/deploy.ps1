# Deploy AKS
terraform init -input=false
if ($LASTEXITCODE -ne 0) { 
    Write-Host 'terraform init failed in $folder' -ForegroundColor Red
    exit 1
}

terraform apply -auto-approve
if ($LASTEXITCODE -ne 0) { 
    Write-Host 'terraform apply failed in $folder' -ForegroundColor Red
    exit 1
}

Write-Host 'All Terraform resources have been deployed!' -ForegroundColor Yellow

# Config kubeconfig
Write-Host 'Configuring kubeconfig...' -ForegroundColor Cyan
az account set --subscription 922ef694-a56b-40f9-b615-36e3aedb343f
az aks get-credentials --resource-group CloudEx-Seneca-K8s-RG --name CookingMaster-K8S-Cluster --overwrite-existing

# Deploy apps
# Write-Host 'Provisioning apps...' -ForegroundColor Cyan
kubectl apply -f .\app\configmap.yaml
kubectl apply -f .\app\secrets.yaml
kubectl apply -f .\app\services.yaml
kubectl apply -f .\app\dbs.yaml
Start-Sleep 30
kubectl apply -f .\app\backends.yaml
Start-Sleep 45
# Deploy NGINX Controller and ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml
Start-Sleep 45
kubectl apply -f .\app\nginx-ingress.yaml
Start-Sleep 45
Write-Host 'All apps have been deployed!' -ForegroundColor Yellow

# Update LB pip to Configmap
$env:LB_IP = $(kubectl get ingress example-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
kubectl patch configmap/app-config --type merge -p "{\`"data\`":{\`"REACT_APP_API_URL\`":\`"http://$env:LB_IP\`",\`"REACT_APP_RECIPE_API_URL\`":\`"http://$env:LB_IP\`"}}"
Start-Sleep 5

# Deploy frontend
kubectl apply -f .\app\frontend.yaml
Write-Host "App is ready at http://$env:LB_IP" -ForegroundColor Yellow