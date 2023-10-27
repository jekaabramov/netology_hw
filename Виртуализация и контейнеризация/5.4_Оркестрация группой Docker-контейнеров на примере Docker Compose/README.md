# 5.4 Оркестрация группой Docker-контейнеров на примере Docker Compose - Абрамов Евгений

### Задача 1

### Задача 2

```
abramov@abramov:~/neology/config/Terraform/5.4$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.node01 will be created
  + resource "yandex_compute_instance" "node01" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node01.netology.cloud"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                debian:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCRxdcX62gYIsf0t8pLZMLcDnWye6MXEzWoIsYwe6ma6ANRVD5TcY7U2+ijejTEeA+xAP6jg1JtBCGSQH6dMBQ9zrqYRQOTBBvzrB+QV9gUa6spVNZANLerWXmUVzFgXnr1J1F8LgkTdsLP5+uXBf99QJD732qPwcjaqQQmbRPxYCak1bdCOvUMh7S9Qu0XE5GN8wZu3ycuAZnxi4MVxCdQ5qyxcq0wN0v3830zVfeN18JGdumU0ff5kewtjVRUlM5Ro7z06nYHxhLfyraObykXYrqii1w+FebbF06x4T3QYb1Vx4I5JA7yt0JrCUBMfcBcAxQSfxhEwwjv4nuDHw7S6isXObuDkMPPSEo+PwjAb46HC96RsfoTG2UJtK6YPmG2Uuu0eTRAbEyzsyYJmhV+tYV1eV3akf9tTxn/Kd460VMsCnHO6V+oPDlgebsyme6wyU59Cc9AfIFD/13WkKUuGQqo2PvkSnWKaMhJ0v/OSU9InkhE6uekQy9N6G/hujk= abramov@abramov
            EOT
        }
      + name                      = "node01"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8g0bsl0pu22gmd485u"
              + name        = "root-node01"
              + size        = 50
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 8
          + memory        = 8
        }
    }

  # yandex_vpc_network.default will be created
  + resource "yandex_vpc_network" "default" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.default will be created
  + resource "yandex_vpc_subnet" "default" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.101.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_node01_yandex_cloud = (known after apply)
  + internal_ip_address_node01_yandex_cloud = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.default: Creating...
yandex_vpc_network.default: Creation complete after 8s [id=enpjp2jbl5kjublmr1mg]
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 2s [id=e9bl7d739h92e16htu9m]
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node01: Still creating... [50s elapsed]
yandex_compute_instance.node01: Still creating... [1m0s elapsed]
yandex_compute_instance.node01: Still creating... [1m10s elapsed]
yandex_compute_instance.node01: Creation complete after 1m11s [id=fhma43st5fho0h0or2km]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01_yandex_cloud = "158.160.113.46"
internal_ip_address_node01_yandex_cloud = "192.168.101.3"
```
