terraform {
  # Backend docs:  https://developer.hashicorp.com/terraform/language/settings/backends/configuration
  backend "azurerm" {
    # @TODO this backend is currently unprotected from the public internet, that s/b fixed
    # some examples: https://shisho.dev/dojo/providers/azurerm/Storage/azurerm-storage-account-network-rules/
    resource_group_name  = "devops-the-hard-way-backend-rg"
    storage_account_name = "devopsthehardwaybackend"
    container_name       = "tfstate"
    key                  = "root-terraform.tfstate"
  }
}

provider "azurerm" {
  # version = "~> 2.0"
  features {}
}


# Note from the docs:
# "When you change a backend's configuration, you must run terraform init again to validate and configure the backend before you can perform any plans, applies, or state operations."