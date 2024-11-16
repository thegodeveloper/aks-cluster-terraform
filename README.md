# AKS Cluster Terraform

## Requirements

To run locally:

- azure-cli
- tfenv
- Terraform version `v1.9.8` installed with `tfenv`
- Export the variable `TF_VAR_subscription_id=SUBSCRIPTION_ID_VALUE`

## Get AKS Current Versions

```shell
az aks get-versions --location centralus -o table
```

## Connect to Azure AKS Cluster

````shell
az aks get-credentials --resource-group terraform-aks-dev --name terraform-aks-dev-cluster --admin --overwrite-existing
````
