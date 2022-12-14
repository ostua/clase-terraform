# incluimos el proveedor de Proxmox en terraform
terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

# configuramos el proveedor
provider "proxmox" {
  # Descomenta y completa estas 3 lineas:
  #pm_api_url  = "https://cronos.dte.us.es:8006/api2/json"
  #pm_user     = "USUV@pve"
  #pm_password = "clavesecreta"

  # depuracion
  pm_log_enable = false
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
