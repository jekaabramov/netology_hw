
resource "yandex_compute_disk" "storage_disk" {
  count   = 3
  name    = "storage-disk-${count.index + 1}"
  folder_id = var.folder_id
  size    = 1
  zone    = var.default_zone

  labels = {
    environment = "production"
  }
}

resource "yandex_compute_instance" "storage_vm" {
  name         = "storage"
  folder_id    = var.folder_id
  zone         = var.default_zone
  platform_id  = "standard-v1"
  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.os_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
    }
  }
}
