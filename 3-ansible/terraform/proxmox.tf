variable "proxmox_host" {
  type = map(any)
  default = {
    # Descomenta y completa estas 3 lineas:
    #pm_api_url = "https://cronos.dte.us.es:8006/api2/json"
    #pm_user = "UVUS@pve"
    #pm_password = "clavesecreta"
    target_node = "cronos"
  }
}

variable "vmid" {
  # Valor unico
  default     = 350
  description = "Starting ID for the CTs"
}

variable "hostnames" {
  description = "Containers to be created"
  type        = list(string)
  # Valor unico
  default     = ["lxcterra"]
}

variable "rootfs_size" {
  description = "Root filesystem size in GB"
  default     = "2G"
}

variable "ips" {
  description = "IPs of the containers, respective to the hostname order"
  type        = list(string)
  # valor unico
  default = ["10.20.30.240"]
}

variable "user" {
  default     = "root"
  description = "Ansible user used to provision the container"
}

variable "ssh_keys" {
  type = map(any)
  default = {
    pub  = "clave_ssh.pub"
    priv = "clave_ssh"
  }
}
