resource "proxmox_virtual_environment_vm" "vm2" {
  name        = "vm-ostua-2"
  description = "Managed by Terraform"
  tags        = ["terraform", "debian"]

  pool_id = "ISI-terraform"
  node_name = "asterix"
# el VMID debe ser unico en el cluster.
# si lo dejo comentado coge el primero libre.
#  vm_id     = 3999

  started = true
  stop_on_destroy = true

  timeout_create = 60
  timeout_migrate  = 60
  timeout_reboot = 60
  timeout_shutdown_vm = 60
  timeout_start_vm = 60
  timeout_stop_vm = 60

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
    floating = 1024
  }

  disk {
    datastore_id = "local-ssd"
    file_format = "raw"
    interface    = "scsi0"
    size = 2
  }

  cdrom {
    enabled = true
    file_id = "nfs-coria:iso/ostua-debian-13.1.0-amd64-netinst.iso"
    interface    = "ide0"
  }

  network_device {
    bridge = "vmbr0"
  }

}
