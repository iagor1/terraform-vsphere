terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.7.0"
    }
  }
}

provider "vsphere" {
  user                 = var.user
  password             = var.password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

#Data
data "vsphere_datacenter" "dc" {
  name = var.dc
}

data "vsphere_datastore" "ds" {
  name          = var.ds
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}


data "vsphere_content_library" "library" {
  name = "PVH1"
}

data "vsphere_content_library_item" "item" {
  name       = var.item_library
  type       = "ovf"
  library_id = data.vsphere_content_library.library.id
}

resource "vsphere_virtual_machine" "vm" {
  name                       = var.VM_Name
  resource_pool_id           = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id               = data.vsphere_datastore.ds.id
  firmware                   = var.firmware
  num_cpus                   = var.vm_memory
  memory                     = var.vm_memory
  wait_for_guest_net_timeout = 5
  wait_for_guest_ip_timeout  = 0
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 200
  }
  clone {
    template_uuid = data.vsphere_content_library_item.item.id
  }
  vapp {
    properties = {
      "guestinfo.hostname"  = "pvh-devterraform1",
      "guestinfo.ipaddress" = "127.0.0.1",
      "guestinfo.netmask"   = "255.255.255.0",
      "guestinfo.gateway"   = "127.0.0.1",
      "guestinfo.dns"       = "127.0.0.1",
      "guestinfo.domain"    = "test.local",
      "guestinfo.password"  = "passwd",
      "guestinfo.ssh"       = "True"
    }
  }
}

output "dc-id" {
  value = data.vsphere_datacenter.dc.id
}