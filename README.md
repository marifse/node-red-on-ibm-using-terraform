<p align="center">
    <a href="https://cloud.ibm.com">
        <img src="https://cloud.ibm.com/media/docs/developer-appservice/resources/ibm-cloud.svg" height="100" alt="IBM Cloud">
    </a>
</p>

<p align="center">
    <a href="https://cloud.ibm.com">
    <img src="https://img.shields.io/badge/IBM%20Cloud-powered-blue.svg" alt="IBM Cloud">
    </a>
    <img src="https://img.shields.io/badge/platform-node-lightgrey.svg?style=flat" alt="platform">
    <img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
</p>


# Deploy Node-RED on IBM Cloud

This document will describe how to setup Node-RED on IBM Cloud Kubernetes Service using Terraform (IaaC Tool).

### Contents

#### 1.     Introduction
#### 2.     Pre-requisites
#### 3.     Deploying Node-RED to IBM Cloud Kubernetes cluster using Terraform
#### 3.1.     To an existing Kubernetes cluster
#### 3.2	  To a new Kubernetes cluster    


### 1.0 Introduction

To complete this tutorial, you should have an IBM Cloud account, if you do not have one, please [register/signup](https://cloud.ibm.com/registration) here. 

**Note:** You can perform this job either using free cluster or standard cluster, in this tutorial it is done using free cluster.

### 2.0 Pre-requisites

To deploy Node-RED on IBM Cloud Kubernetes service using Terraform, you should have the following software installed on your system.

  -	Terraform
  -	IBM Cloud CLI (optional)
  -	Kubectl (optional)

### 3.0	Deploying Node-RED to IBM Cloud Kubernetes cluster using Terraform

<p align="center">
    <a href="https://cloud.ibm.com/developer/appservice/create-app?defaultDeploymentToolchain=&defaultLanguage=NODE&navMode=starterkits&starterKit=3f3f65c6-4a2c-3255-8e80-d2ac52ca608a">
    <img src="https://cloud.ibm.com/devops/setup/deploy/button_x2.png" alt="Deploy to IBM Cloud">
    </a>
</p>

This repo includes two subfolders, one for deploying Node-RED to an existing Kubernetes cluster and while the other subfolder is for deploying Node-RED along with creating the Kubernetes cluster and deploying Node-RED on top of it.

To start deploying, clone the repo to local machine using the following command and follow the instructions in next section as per the scenario available.

```bash
git clone https://github.com/marifse/node-red-on-ibm-using-terraform.git
```
### 3.1	To an existing Kubernetes cluster

To deploy Node-RED on existing cluster clone the repo as mentioned in the above step 3.0, and follow the steps below. 

•	Go into sub-directory [(with-existing-cluster)](https://github.com/marifse/node-red-on-ibm-using-terraform/tree/main/with-existing-cluster) of cloned repo with below command.

```bash
cd node-red-on-ibm-using-terraform/with-existing-cluster/
```

•	Replace the **API key** value with your key and the **cluster_id** variable with your cluster name in variables.tf file.

•	Initialize the repo using the below command.

```bash
terraform init
```

•	Deploy Node-RED with using the terraform command below:

```bash
terraform apply
```

• Confirm with **yes**.

Once the Node-RED has been deployed onto the cluster, you will get the port number on which the node-red application will be running. To check the nodeport ip address, you can see it from IBM Cloud console in cluster details. You can open the Node-RED with IPAddress:port on any browser.

•	To destroy the deployment run below terraform command.

```bash
terraform destroy
```

### 3.2	To a new Kubernetes cluster

To deploy Node-RED along-with creating the new cluster. Clone the repo as mentioned in above step 3.0, and follow the steps below: 

•   Go to sub-directory [(with-new-cluster)](https://github.com/marifse/node-red-on-ibm-using-terraform/tree/main/with-new-cluster) of cloned repo with the following command.

```bash
cd node-red-on-ibm-using-terraform/with-new-cluster/
```

•   Replace the **API key** value with your key and set the **cluster name** in variables.tf file.

•   Initialize the repo with the following command.

```bash
terraform init
```

•   Provision the Kubernetes cluster with the terraform command as follows:

```bash
terraform apply
```
•   Confirm with **yes**

•   Once the cluster has been provisioned, go to the sub-directory [node-red-on-ibm-using-terraform/with-new-cluster/helm/](https://github.com/marifse/node-red-on-ibm-using-terraform/tree/main/with-new-cluster/helm) using the following command.

```bash
cd node-red-on-ibm-using-terraform/with-new-cluster/helm/
```

•   Replace the **API key** value with your key and set the cluster name in variables.tf file.

•	Initialize this repo again with the following command.

```bash
terraform init
```
•   Deploy Node-RED using the following terraform command.
```bash
terraform apply
```

Once the Node-red has been deployed to the cluster, you would get the port number on which the Node-RED will be running. To check the nodeport IP address you can see it from IBM Cloud console in cluster details. You can open the Node-RED with IPAddress:port on any browser.

•	To destroy the deployment run below terraform command.

```bash
terraform destroy
```
