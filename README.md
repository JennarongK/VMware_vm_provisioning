# VMware_vm_provisioning Module

For Virtual Machine Provisioning with (Linux) customization. Based on Terraform v1.0.5. and up

## Getting started

First, create a `main.tf` file.

Next, copy the code below and fill in the required variables.

```hcl
# Configure the VMware vSphere Provider
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

```

Next, run `terraform init` and run `terraform plan`

Finally, run `terraform apply`


## Execution

### terraform init 

The first command to run for a new configuration is  `terraform init`, which initializes various local settings and data that will be used by subsequent commands. This command will also automatically download and install any provider defined in the configuration.

### terraform plan

The  `terraform plan`  command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

This command is a convenient way to check whether the execution plan for a set of changes matches your expectations without making any changes to real resources or to the state.

### terraform apply 

The `terraform apply` command is used to **apply the changes required to reach the desired state of the configuration**.

### terraform destroy 

Resources can be destroyed using the `terraform destroy` command, which is similar to `terraform apply`, but it behaves as if all of the resources have been removed from the configuration.


