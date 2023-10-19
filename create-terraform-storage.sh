#!/bin/sh

RESOURCE_GROUP_NAME="devops-the-hard-way-backend-rg"
STORAGE_ACCOUNT_NAME="devopsthehardwaybackend"
STORAGE_CONTAINER_NAME="tfstate"
LOCATION="centralindia"
SKU="Standard_LRS"

# Create Resource Group
az group create -l $LOCATION -n $RESOURCE_GROUP_NAME

# Create Storage Account
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l $LOCATION --sku $SKU

# Create Storage Account blob
az storage container create  --name $STORAGE_CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME