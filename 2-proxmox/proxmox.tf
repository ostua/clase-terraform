# incluimos el proveedor de Proxmox en terraform
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.68.0"
    }
  }
}

# configuramos el proveedor
provider "proxmox" {
  # completa estas 3 lineas:
  endpoint = "https://cronos.dte.us.es:8006/"
  username = "MIUSUARIO@pve"
  password = "MICLAVE"

}
