module "vm" {
  for_each = var.tools
  source = "./vm-module"
  component = each.key
  ssh_password = var.ssh_password
  ssh_username = var.ssh_username
  port = each.value["port"]
}

variable "tools" {
  default = {

    vault = {
      port = 8200
    }
  }
}

variable "ssh_username" {}
variable "ssh_password" {}

terraform {
  backend "azurerm" {
    resource_group_name  = "project-setup-1"
    storage_account_name = "katari"
    container_name       = "tools-tf-state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "52cd5f2c-0d28-4429-b80d-950089f20b98"
}