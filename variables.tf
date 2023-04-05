### Change the "default" value according to your environment!
# the ips are all fake
variable "user"{
    type = string
    default = "user@domain.local"
}

variable "password"{
    type = string
    default = "password"
}

#if you dont setup a default value, terraform will ask the value when running terraform plan or apply
variable "vm_count" {
  description = "Number of instaces"
  type        = number
}
variable "vm_name" {
  description = "vm name : "
  type = string
}
variable "host_name" {
  type = string
  default = "localhost"
}

variable "domain" {
  type = string
  default = "localdomain"
}

variable "private_IP" {
  description = "Avaliable IP"
  type        = list(string)
  default = [
    "",
    "192.24.1.106",
    "192.24.1.107",
    "192.24.1.108",
    "192.24.1.109",
    "192.24.1.110",
    "192.24.1.111",
    "192.24.1.112",
    "192.24.1.113",
    "192.24.1.114",
    "192.24.1.115",
  ]
}

variable "vsphere_server" {
  type = string
  description = "Server address"
  default = "192.18.1.20"
}

variable "dc"{
    type = string
    default = "DataCenter name"
}
variable "ds" {
    type = string
    default = "DataStore name"
}

variable "vsphere_insecure_connection" {
    type = bool
    description = "The SSL is invalid?"
    default = true
}
variable "vsphere_compute_cluster" {
  type = string
  default = "compute cluster name"
}

#ip address or FQDN
#change this to your environment
variable "vsphere_host" {
  type = string
  default = "192.20.120.140"
  description = "Host address"
}

variable "vsphere_network" {
  type = string
  default = "network name"
}
variable "resource_pool" {
  type = string
  default = "Resource pool name"
}

variable "vsphere_virtual_machine-template" {
  type = string
  default = "vm template name"
}

#the guest id need to be the same as the template
variable "guest_id" {
  type = string
  default = "rhel8_64Guest"
}

variable "folder" {
  type = string
  default = "folder name"
}
variable "num_cpus" {
  description  = "num cpus : "
}
variable "memory" {
  type = number
  default = 4096
}
#your ip gateway
variable "ipv4_gateway" {
  type = string
  default = "192.24.1.10"
}
#your netmask ip
variable "ipv4_netmask" {
  type = number
  default = 24
}