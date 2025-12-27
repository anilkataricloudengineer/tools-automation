provider "vault" {
  address = "http://vault-internal.anilcloudengineer.online:8200"
  token = var.token
}

terraform {
  backend "azurerm" {
    resource_group_name  = "project-setup-1"
    storage_account_name = "katari"
    container_name       = "vault-tf-states"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "52cd5f2c-0d28-4429-b80d-950089f20b98"
}

variable "token" {}
