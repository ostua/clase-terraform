# incluimos el proveedor de Proxmox en terraform
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.57.0"
    }
  }
}

# configuramos el proveedor
provider "proxmox" {
  # completa estas 3 lineas:
  endpoint = "https://asterix.dte.us.es:8006/"
  username = "MIUSUARIO@pve"
  password = "MICLAVE"

}
