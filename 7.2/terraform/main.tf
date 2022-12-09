# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone      = "ru-central1-a"

}
# ресурс "yandex_compute_instance" т.е. сервер
# Terraform будет знаеть его по имени "yandex_compute_instance.default"
resource "yandex_compute_instance" "ubuntu" {
    name = "test-instance"
	platform_id = "standard-v1" # тип процессора (Intel Broadwell)

  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores  = 2 # vCPU
    memory = 1 # RAM
  }

  boot_disk {
    initialize_params {
      image_id = "fd8v0s6adqu3ui3rsuap" # ОС (Ubuntu, 22.04 LTS)
      name     = "ubuntu"
      type     = "network-nvme"
      size     = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}" # одна из дефолтных подсетей
    nat = true # автоматически установить динамический ip
    ip_address = "192.168.101.11"
  }
}



