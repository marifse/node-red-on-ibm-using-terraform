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


# Deploy NodeJS+Cloudant Application on IBM Cloud using Terraform

This document will describe how to deploy NodeJS application on IBM Cloud Kubernetes Service using Terraform (IaC Tool).

### Contents

#### 1.     Introduction
#### 2.     Pre-requisites
#### 3.     Deploying to IBM Cloud using Terraform
#### 3.1	    Using Tekton Toolchain pipeline
#### 3.1.1      To a new Kubernetes cluster
#### 3.2	    Using Classic Toolchain pipeline
#### 3.2.1	    To a new Kubernetes cluster 
#### 3.2.2      To an existing Kubernetes cluster


### 1.0 Introduction

To complete this tutorial, you should have an IBM Cloud account, if you do not have one, please [register/signup](https://cloud.ibm.com/registration) here. This application requires the Kubernetes cluster for running NodeJS application and the Cloudant database service for hosting the database.

**Note:** You can perform this job either using free cluster or standard cluster, in this tutorial it is done using free cluster.

### 2.0 Pre-requisites

To deploy NodeJS application on IBM Cloud Kubernetes service using Terraform, you should have the following software installed on your system.

  -	Terraform
  -	IBM Cloud CLI
  -	Kubectl
  -	JQ

### 3.0	Deploying to IBM Cloud using Terraform

<p align="center">
    <a href="https://cloud.ibm.com/developer/appservice/create-app?defaultDeploymentToolchain=&defaultLanguage=NODE&navMode=starterkits&starterKit=3f3f65c6-4a2c-3255-8e80-d2ac52ca608a">
    <img src="https://cloud.ibm.com/devops/setup/deploy/button_x2.png" alt="Deploy to IBM Cloud">
    </a>
</p>

This repo includes two subfolders, one for deploying NodeJS application to Kubernetes cluster with Classic toolchain and while the other subfolder is for deploying the same with Tekton toolchain. 

To start deploying, clone the repo to local machine using the following command and follow the instructions in next section as per the scenario available.

```bash
git clone https://github.com/marifse/nodejs-cloudant.git
```
### 3.1	Using a Tekton Toolchain pipeline

### 3.1.1 To a new Kubernetes cluster

To deploy NodeJS to a new Kubernetes cluster, clone the repo as mentioned in above step 3.0, and follow the steps below. 

•	Go into sub-directory (nodejs-cloudant/terraform/simple-kube/tekton/new-infra/) of cloned repo with below command.

```bash
cd nodejs-cloudant/terraform/simple-kube/tekton/new-infra
```

•	Replace the API key value with your key and set the other variables values as desired or required.

•	Initialize the repo with below command.

```bash
terraform init
```

•	Deploy NodeJS application with below terraform command.

```bash
terraform apply
```

• Confirm with “yes”.

This terraform script will provision the IKS free Classic cluster, Cloudant database, and a Tekton toolchain, which is auto triggered on its creation and deploying the application to the created IKS Kubernetes cluster.

To get the URL for deployed application, go to Toolchain service in IBM Cloud console, and select the region where the toolchain has been created and go to triggered event, and there in deployment stage, you can find the application URL as IPAddress:port in last lines of the executions. Open that URL in browser and you can see the NodeJS application deployed there.
•	To destroy the deployment run below terraform command.

```bash
terraform destroy
```

### 3.1	Using a Classic Toolchain pipeline

To deploy NodeJS to a new Kubernetes cluster using Classic pipeline, there are two options either deploying to existing Kubernetes cluster or to a new Kubernetes cluster.

### 3.2.1 To a new Kubernetes cluster

Clone the repo as told in above step 3.0, and follow the below steps. 

• Go into sub-directory [(with-new-cluster)](https://github.com/marifse/nodejs-cloudant/tree/master/terraform/simple-kube/classic-pipeline/new-infra) of cloned repo with below command.

```bash
cd nodejs-cloudant/terraform/simple-kube/classic-pipeline/new-infra/
```

• Replace the **API key** value with your key and set the **cluster name, Cloudant database name, and the container registry namespace** and other variables as desired.

•	Initialize the repo with below command.

```bash
terraform init
```

•	Deploy NodeJS with below terraform command.

```bash
terraform apply
```

• Confirm with “yes”.

Once all the resources have been provisioned, you can go to the Toolchain service in IBM Cloud console and in deployed region, you would find the delivery pipeline, there would be three stages, and in third deployment stage, you would find the URL for your NodeJS application deployed over there. You can open that URL in browser and see your application running.

•	To destroy the deployment run below terraform command.

```bash
terraform destroy
```

### 3.2.2 To an existing Kubernetes cluster

Clone the repo as mentioned in above step 3.0, and follow the steps below. 

• Go into sub-directory (with-existing-cluster) of cloned repo with below command.

```bash
cd nodejs-cloudant/terraform/simple-kube/classic-pipeline/on-existing-cluster-cloudant
```

•	Replace the API key value with your key and set the cluster name and the Cloudant database name with your existing IKS cluster name and Cloudant DB name, and other variables as desired.

•	Initialize the repo with below terraform command.

```bash
terraform init
```

•	Deploy NodeJS with below terraform command.

```bash
terraform apply
```

• Confirm with “yes”.

Once all the resources have been provisioned, you can go to the Toolchain service in IBM Cloud console and in deployed region, you would find the delivery pipeline, there would be three stages, and in third deployment stage, you would find the URL for your NodeJS application deployed over there. You can open that URL in browser and see your application running.

•	To destroy the deployment run below terraform command.

```bash
terraform destroy
```

