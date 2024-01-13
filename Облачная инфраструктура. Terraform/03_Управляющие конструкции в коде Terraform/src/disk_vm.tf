resource "yandex_compute_disk" "storage_disk" {
  count = 3

  name        = "disk-${count.index + 1}"
  folder_id   = var.folder_id
  zone        = var.default_zone
  size        = 1
}

resource "yandex_compute_instance" "storage" {
  name         = "storage"
  folder_id    = var.folder_id
  zone         = var.default_zone
  platform_id  = "standard-v1"
  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.os_image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
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

