resource "proxmox_virtual_environment_vm" "vm1" {
  name        = "vm-ostua-1"
  description = "Managed by Terraform"
  tags        = ["terraform", "ubuntu"]

  pool_id = "ISI-terraform"
  node_name = "asterix"
# el VMID debe ser unico en el cluster.
# si lo dejo comentado coge el primero libre.
#  vm_id     = 3998
 
  stop_on_destroy = true

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
    floating = 2048
  }

  disk {
    datastore_id = "local-ssd"
    file_format = "raw"
    interface    = "scsi0"
    size = 4
  }

  cdrom {
    enabled = true
    file_id = "nfs-coria:iso/ostua-ubuntu-24.04.3-live-server-amd64.iso"
    interface    = "ide0"
  }

  network_device {
    bridge = "vmbr0"
  }
}
