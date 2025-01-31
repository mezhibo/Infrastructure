terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}
provider "yandex" {
  cloud_id  = "b1gvqb4s3f495f55ih0b"
  folder_id = "b1glq93bir0j2f0sl892"
  token     = var.yc_token
}

resource "yandex_compute_instance" "vm" {
  name        = "example-vm"
  platform_id = "standard-v1"
  zone        = "ru-central1-a" # Укажите нужную зону
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8hr27j6bkf6bd0tdsh" # ID образа Ubuntu
    }
  }
  network_interface {
    subnet_id = "e9btch7bcafsh9buvka2"
    nat       = true
  }
}
