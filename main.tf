# https://www.infoblox.com/wp-content/uploads/infoblox-deployment-guide-infoblox-ipam-plugin-for-terraform.pdf

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.1.1"
    }
  }
}

provider "vsphere" {
  user = "${var.vcenter_user}"
  password = "${var.vcenter_pass}"
  vsphere_server = "${var.vcenter_server}"
  allow_unverified_ssl = true
}

resource "random_pet" "random_name" {
  prefix = "tetv"
}