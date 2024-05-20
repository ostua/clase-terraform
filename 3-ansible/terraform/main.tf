
resource "proxmox_virtual_environment_container" "container" {
  node_name = "asterix"
# el VMID debe ser unico en el cluster.
# si lo dejo comentado coge el primero libre.
#  vm_id     = 3501

  pool_id         = "ISI-terraform"

  clone {
    datastore_id = "local-ssd"
    vm_id = 3500
  }

  initialization {
    hostname    = "lxc-ansible"

    ip_config {
      ipv4 {
#  ¡¡¡esta dirección IP debe ser única!!!
        address = "10.20.30.99/24"
        gateway = "10.20.30.1"
      }
    }
  }

  provisioner "local-exec" {
    working_dir = "../ansible/"
#  ¡¡¡esta dirección IP debe ser la misma de arriba (no quitar la coma después de la IP)!!!
    command     = "ansible-playbook -u root --key-file clave_ssh -i 10.20.30.99, provision.yaml"
  }

}
