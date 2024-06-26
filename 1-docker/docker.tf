# defino proveedor "docker", dónde descargarla del registro y su versión
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# instancio el proveedor, por defecto se conecta al docker local.
provider "docker" {}

# defino un recurso "nginx" para un módulo "docker_image" 
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# defino otro recurso "nginx" para un módulo "docker_container" 
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx-ostua"
  ports {
    internal = 80
    external = 5555
  }
}
