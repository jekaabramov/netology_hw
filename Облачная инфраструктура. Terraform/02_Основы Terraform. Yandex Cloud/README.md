# 02 «Основы Terraform. Yandex Cloud» - Абрамов Е. Э.

https://github.com/jekaabramov/ter-homeworks/tree/main/02/src

### Задание 1

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/02_%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B%20Terraform.%20Yandex%20Cloud/img/1-1.png)
![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/02_%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B%20Terraform.%20Yandex%20Cloud/img/1-2.png)

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

https://github.com/jekaabramov/ter-homeworks/blob/main/02/src/locals.tf

### Задание 6

https://github.com/jekaabramov/ter-homeworks/blob/main/02/src/vms_platform.tf \
https://github.com/jekaabramov/ter-homeworks/blob/main/02/src/variables.tf