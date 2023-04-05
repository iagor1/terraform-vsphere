terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.3.1"
    }
  }
}
# read the comments!!!

provider "vsphere" {
  user           = var.user
  password       = var.password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = var.vsphere_insecure_connection
} 

data "vsphere_datacenter" "dc" {
  name = var.dc
}

data "vsphere_datastore" "ds"{
  name =  var.ds
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster"{
  name = var.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

# change the variables according to your environment
# this project creates clones of templates already created on vcenter and will use a vm template to deploy the clones
# the blocks "data" is a resource that already exists in vcenter
# the blocks "resource" creates a resource in vcenter

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_virtual_machine-template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count            = var.vm_count
  name             = "${var.vm_name}-${count.index + 1 }"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id
  num_cpus         = var.num_cpus
  memory           = var.memory
  guest_id         = var.guest_id
  folder           = var.folder
  network_interface {
    network_id   = data.vsphere_network.network.id
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${var.host_name}${count.index +1}"
        domain    = "${var.domain}${count.index +1}"
      }
      network_interface {
        ipv4_address = var.private_IP[count.index + 1]
        ipv4_netmask = var.ipv4_netmask
      }
        dns_server_list = ["8.8.8.8", "4.4.4.4"]
      ipv4_gateway = var.ipv4_gateway
    }
  }
}


output "dc-id" {
  value = data.vsphere_datacenter.dc.id
}