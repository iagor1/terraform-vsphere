### Change the "default" value according to your environment!
# the ips are all fake
variable "user" {
  type    = string
  default = "usertest@test.local"
}

variable "password" {
  type    = string
  default = "passwd"
}

variable "vsphere_server" {
  type        = string
  description = "Host ip - vsphere"
  default     = "127.0.0.1"
}

variable "dc" {
  type    = string
  default = "Dc-test"
}
variable "ds" {
  type    = string
  default = "Datastore-test"
}

variable "cluster" {
  type    = string
  default = "Cluster-test"
}

variable "network" {
  type    = string
  default = "nic_test"
}

variable "VM_Name" {
 description = "VM NAME?"
}

variable "item_library" {
  type = string
  default = "rhel9_ovf"
}

variable "library" {
  type = string
  default = "Test"
}

variable "vm_memory" {
  type = number
  default = 4098
}

variable "vm_cpu" {
  type = number
  default = 4
}

variable "firmware" {
  type = string
  default = "efi"
}