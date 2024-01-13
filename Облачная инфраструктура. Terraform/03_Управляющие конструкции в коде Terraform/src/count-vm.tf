resource "yandex_compute_instance" "web" {
  count = 2

  name         = "web-${count.index + 1}"
  folder_id    = var.folder_id
  zone         = var.default_zone
  platform_id  = "standard-v1"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.os_image_id  # Specify the desired OS image identifier
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true

  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
