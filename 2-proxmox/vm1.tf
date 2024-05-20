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
    cores = 4
  }

  memory {
    dedicated = 8000
    floating = 8000
  }

  disk {
    datastore_id = "local-ssd"
    file_format = "raw"
    interface    = "scsi0"
    size = 16
  }

  cdrom {
    enabled = true
    #file_id = "nfs-coria:iso/ubuntu-22.04.4-desktop-amd64.iso"
    file_id = "nfs-coria:iso/ubuntu-24.04-desktop-amd64.iso"
    #file_id = "nfs-coria:iso/ubuntu-24.04-live-server-amd64.iso"
    interface    = "ide0"
  }

  network_device {
    bridge = "vmbr0"
  }

}

