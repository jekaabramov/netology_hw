# 5.4 Оркестрация группой Docker-контейнеров на примере Docker Compose - Абрамов Евгений

### Задача 1
![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%92%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B8%20%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F/5.4_%D0%9E%D1%80%D0%BA%D0%B5%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B3%D1%80%D1%83%D0%BF%D0%BF%D0%BE%D0%B9%20Docker-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%BE%D0%B2%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5%20Docker%20Compose/img/1.png)

### Задача 2

```
abramov@abramov:~/neology/config/5.4/virtd-homeworks/05-virt-04-docker-compose/src/terraform$ t
erraform apply
yandex_vpc_network.default: Refreshing state... [id=enpsbnnvpgqgljdg3f00]
yandex_vpc_subnet.default: Refreshing state... [id=e9bmfoplup87muk4u541]

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
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
              + image_id    = "fd8hksavvldvav594gst"
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
          + subnet_id          = "e9bmfoplup87muk4u541"
        }

      + resources {
          + core_fraction = 100
          + cores         = 8
          + memory        = 8
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  ~ external_ip_address_node01_yandex_cloud = "158.160.46.76" -> (known after apply)
  ~ internal_ip_address_node01_yandex_cloud = "192.168.101.14" -> (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node01: Still creating... [50s elapsed]
yandex_compute_instance.node01: Still creating... [1m0s elapsed]
yandex_compute_instance.node01: Creation complete after 1m4s [id=fhmdmc1var2cit52f1pe]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01_yandex_cloud = "158.160.55.67"
internal_ip_address_node01_yandex_cloud = "192.168.101.26"
```

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%92%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B8%20%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F/5.4_%D0%9E%D1%80%D0%BA%D0%B5%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B3%D1%80%D1%83%D0%BF%D0%BF%D0%BE%D0%B9%20Docker-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%BE%D0%B2%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5%20Docker%20Compose/img/2.png)

### Задача 3

```
root@node01:~# docker ps
CONTAINER ID   IMAGE                              COMMAND                  CREATED         STATUS                   PORTS                                                                              NAMES
d53833b730b9   prom/pushgateway:v1.2.0            "/bin/pushgateway"       5 minutes ago   Up 5 minutes             9091/tcp                                                                           pushgateway
f7e05163d17c   stefanprodan/caddy                 "/sbin/tini -- caddy…"   5 minutes ago   Up 5 minutes             0.0.0.0:3000->3000/tcp, 0.0.0.0:9090-9091->9090-9091/tcp, 0.0.0.0:9093->9093/tcp   caddy
b8cff6ab336a   prom/prometheus:v2.17.1            "/bin/prometheus --c…"   5 minutes ago   Up 5 minutes             9090/tcp                                                                           prometheus
e2ef7d32d649   prom/alertmanager:v0.20.0          "/bin/alertmanager -…"   5 minutes ago   Up 5 minutes             9093/tcp                                                                           alertmanager
2a3c85ff7298   prom/node-exporter:v0.18.1         "/bin/node_exporter …"   5 minutes ago   Up 5 minutes             9100/tcp                                                                           nodeexporter
fd9365a80b59   grafana/grafana:7.4.2              "/run.sh"                5 minutes ago   Up 5 minutes             3000/tcp                                                                           grafana
0d71f355a99a   gcr.io/cadvisor/cadvisor:v0.47.0   "/usr/bin/cadvisor -…"   5 minutes ago   Up 5 minutes (healthy)   8080/tcp                                                                           cadvisor
```
### Задача 4

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%92%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B8%20%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F/5.4_%D0%9E%D1%80%D0%BA%D0%B5%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B3%D1%80%D1%83%D0%BF%D0%BF%D0%BE%D0%B9%20Docker-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%BE%D0%B2%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5%20Docker%20Compose/img/4.png)