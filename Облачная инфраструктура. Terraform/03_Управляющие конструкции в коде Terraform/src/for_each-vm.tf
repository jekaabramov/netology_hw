variable "vm_instances" {
  type = list(object({
    vm_name   = string
    cpu       = number
    ram       = number
    disk      = number
    public_ip = bool
    network_id = string
  }))

  default = [
    {
      vm_name   = "main"
      cpu       = 2
      ram       = 2
      disk      = 50
      public_ip = true
      network_id = "your-network-id"
    },

    {
      vm_name   = "replica"
      cpu       = 2
      ram       = 2
      disk      = 100
      public_ip = false
      network_id = "your-network-id"
    },
  ]
}

resource "yandex_compute_instance" "vm" {
  for_each = { for vm in var.vm_instances : vm.vm_name => vm }

  name         = each.value.vm_name
  folder_id    = var.folder_id
  zone         = var.default_zone
  platform_id  = "standard-v1"
  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      size = each.value.disk
      image_id = var.os_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
