#!/bin/sh

RESOURCE_GROUP_NAME="test-devops-thw-rg"
STORAGE_ACCOUNT_NAME="testdevopsthwsa"
LOCATION="centralindia"
# RESOURCE_GROUP_NAME="devopstamops-rg"
# STORAGE_ACCOUNT_NAME="devopstamopssa"

# Create Resource Group
az group create -l $LOCATION -n $RESOURCE_GROUP_NAME

# Create Storage Account
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l centralindia --sku Standard_LRS

# Create Storage Account blob
az storage container create  --name tfstate --account-name $STORAGE_ACCOUNT_NAME