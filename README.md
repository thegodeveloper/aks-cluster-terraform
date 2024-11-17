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

## Get full cluster information

```shell
az aks show --resource-group terraform-aks-dev --name terraform-aks-dev-cluster -o table
Name                       Location    ResourceGroup      KubernetesVersion    CurrentKubernetesVersion    ProvisioningState    Fqdn
-------------------------  ----------  -----------------  -------------------  --------------------------  -------------------  ----------------------------------------------------------
terraform-aks-dev-cluster  centralus   terraform-aks-dev  1.30.5               1.30.5                      Succeeded            terraform-aks-dev-cluster-v9d60zfc.hcp.centralus.azmk8s.io
```

## Deploy the webserver Application

```shell
k apply -f ./kubernetes/manifests/apps/webserver/
deployment.apps/app1-nginx-deployment created
service/app1-nginx-clusterip-service created
```

### Validate the Webserver Application

Get the IP Address of the `app1-nginx-clusterip-service` service.

```shell
http://IP_LOAD_BALANCER/app1/
```

### Delete the Webserver Application

```shell
k delete -f ./kubernetes/manifests/apps/webserver/
deployment.apps "app1-nginx-deployment" deleted
service "app1-nginx-clusterip-service" deleted
```

## Deploy the Java Application

```shell
k apply -f ./kubernetes/manifests/apps/java
storageclass.storage.k8s.io/managed-premium-retain-sc created
persistentvolumeclaim/azure-managed-disk-pvc created
configmap/usermanagement-dbcreation-script created
deployment.apps/mysql created
service/mysql created
deployment.apps/usermgmt-webapp created
service/usermgmt-webapp-service created
```

### Validate the Java Application

Get the IP Address of the `usermgmt-webapp-service` service.

```shell
http://IP_LOAD_BALANCER

Username: admin101
Password: password101
```

### Delete the Java Application

```shell
k delete -f ./kubernetes/manifests/apps/java/
storageclass.storage.k8s.io "managed-premium-retain-sc" deleted
persistentvolumeclaim "azure-managed-disk-pvc" deleted
configmap "usermanagement-dbcreation-script" deleted
deployment.apps "mysql" deleted
service "mysql" deleted
deployment.apps "usermgmt-webapp" deleted
service "usermgmt-webapp-service" deleted
```