# 02 "«Основы Terraform. Yandex Cloud»" - Абрамов Е. Э.

### Задание 1

![]()
![]()

Параметр ```preemptible = true``` позволяет использовать предварительно остановленные (preemptible) инстансы, которые стоят значительно дешевле по сравнению с постоянными инстансами. 

Параметр ```core_fraction=5``` означает, что инстанс использует только 5% вычислительных ресурсов внутри виртуального ядра. 

### Задание 2

```
abramov@abramov:~/neology/config/netology/Облачная инфраструктура. Terraform/ter-homeworks/02/src$ terraform plan
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpkg6753ngqkn0pge8e]
data.yandex_compute_image.ubuntu: Read complete after 2s [id=fd8q5m87s3v0hmp06i5c]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bjj50l0h0pj1kkshgb]
yandex_compute_instance.platform: Refreshing state... [id=fhm964te40qun0246c9n]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
```

### Задание 3

https://github.com/jekaabramov/ter-homeworks/blob/main/02/src/vms_platform.tf

### Задание 4
```
abramov@abramov:~/neology/config/netology/Облачная инфраструктура. Terraform/ter-homeworks/02/src$ terraform output
instance_ip_map = {
  "vm_db" = "158.160.104.254"
  "vm_web" = "51.250.1.86"
}
```

### Задание 5

### Задание 6

### Задание 7
