$folders = @('frontend', 'backend', 'backend-db')

foreach ($folder in $folders) {
    Write-Host '🔹 Destroying $folder...' -ForegroundColor Cyan
    Set-Location $folder

    terraform init -input=false
    if ($LASTEXITCODE -ne 0) { Write-Host '❌ terraform init failed in $folder' -ForegroundColor Red; exit 1 }

    terraform destroy -auto-approve
    if ($LASTEXITCODE -ne 0) { Write-Host '❌ terraform destroy failed in $folder' -ForegroundColor Red; exit 1 }

    Set-Location ..
    Write-Host '✅ $folder destroyed successfully!' -ForegroundColor Green
}

Write-Host '🎉 All Terraform resources have been destroyed!' -ForegroundColor Yellow
