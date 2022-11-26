terraform {
  backend "azurerm" {
    resource_group_name  = "test-devops-thw-rg"
    storage_account_name = "testdevopsthwsa"
    container_name       = "tfstate"
    key                  = "root-terraform.tfstate"
  }
}

provider "azurerm" {
  # version = "~> 2.0"
  features {}
}

