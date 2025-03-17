resource_group_name=$(terraform output -raw resource_group_name)
az aks list --resource-group $resource_group_name --query "[].{\"K8s cluster name\":name}" --output table
#Get the Kubernetes configuration from the Terraform state and store it in a file that kubectl 
#can read using the following command.
echo "$(terraform output kube_config)" > ./azurek8s
cat ./azurek8s
export KUBECONFIG=./azurek8s
