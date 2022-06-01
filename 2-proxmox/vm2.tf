resource "proxmox_vm_qemu" "vm2" {
  name        = "vm-ostua-2"
  target_node = "asterix"
  desc        = "A test VM"
  pool        = "ISI-terraform"

  iso = "nfs-coria:iso/debian-11.2.0-amd64-netinst.iso"
  # OS, do not use this, especially for PXE boot VMs
  agent            = 0
  automatic_reboot = false
  balloon          = 0
  bios             = "seabios"
  # boot order MUST include network first, this is enforced in the Provider
  #boot                   = "order=net0;scsi0"
  cores                  = 2
  cpu                    = "host"
  define_connection_info = true
  force_create           = false
  hotplug                = "network,disk,usb"
  kvm                    = true
  memory                 = 9000
  numa                   = false
  onboot                 = false
  oncreate               = true
  os_type                = "Linux 5.x - 2.6 Kernel"
  qemu_os                = "l26"
  scsihw                 = "virtio-scsi-pci"
  sockets                = 1
  tablet                 = true
  vcpus                  = 0

  disk {
    backup      = 0
    cache       = "none"
    discard     = "on"
    iothread    = 1
    mbps        = 0
    mbps_rd     = 0
    mbps_rd_max = 0
    mbps_wr     = 0
    mbps_wr_max = 0
    replicate   = 0
    size        = "2G"
    ssd         = 1
    storage     = "local-lvm"
    type        = "scsi"
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    model     = "e1000"
  }
}
