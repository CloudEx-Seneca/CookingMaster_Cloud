# Deploy AKS
terraform init -input=false
if ($LASTEXITCODE -ne 0) { 
    Write-Host 'terraform init failed in $folder' -ForegroundColor Red
    exit 1
}

terraform destroy -auto-approve
if ($LASTEXITCODE -ne 0) { 
    Write-Host 'terraform apply failed in $folder' -ForegroundColor Red
    exit 1
}

Write-Host 'All Terraform resources have been destroyed!' -ForegroundColor Yellow
