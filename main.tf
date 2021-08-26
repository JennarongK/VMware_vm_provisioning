provider "vsphere" {
    user                =   "*****"
    password            =   "*****"
    vsphere_server      =   "*****"
  allow_unverified_ssl  = true
}

module "example-server-linuxvm" {
    source = "Terraform-VMware-Modules/vm/vsphere"
    version = "3.3.0"
    vmtemp  = "*****"
    instances   = 2
    vmname  = "*****"
    vmrp    =   "****"
    network =   {
        "VLAN160"= ["****","****"]
    }
    dns_server_list = ["****"]
    ipv4submask = ["24"]
    data_disk = {
    disk1 = {
      size_gb                   = 30,
      thin_provisioned          = false,
      data_disk_scsi_controller = 0,
    },
    disk2 = {
      size_gb                   = 70,
      thin_provisioned          = true,
      data_disk_scsi_controller = 1,
      datastore_id              = "****"
    }
  }

    cpu_number  =   2
    ram_size    =   4096
    vmgateway    =   "****"
    dc          =   "****"
    datastore   =   "****"
    enable_disk_uuid = true
    local_adminpass  = "****"
}
