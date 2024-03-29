# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле [cloud-init.yml](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/demonstration1/cloud-init.yml) необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл [cloud-init.yml](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/demonstration1/cloud-init.yml) установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.
![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/img/01.png)
------

### Задание 2

1. Напишите локальный [модуль vpc](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/src/modules/vpc_dev/main.tf), который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью [output](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/src/modules/vpc_dev/outputs.tf) информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform console 
> module.vpc_dev
{
  "vpc_network" = {
    "created_at" = "2024-02-01T08:00:48Z"
    "default_security_group_id" = "enpmh1lrm5fneoe8jv6f"
    "description" = ""
    "folder_id" = "b1gm6gpv0a61qb7vnrc8"
    "id" = "enp7th0f6f5gfgsjkjh9"
    "labels" = tomap({})
    "name" = "develop"
    "subnet_ids" = tolist([])
    "timeouts" = null /* object */
  }
  "vpc_subnet" = {
    "created_at" = "2024-02-01T08:00:51Z"
    "description" = ""
    "dhcp_options" = tolist([])
    "folder_id" = "b1gm6gpv0a61qb7vnrc8"
    "id" = "e9bsfv6jsoktmarpn5p5"
    "labels" = tomap({})
    "name" = "develop-ru-central1-a"
    "network_id" = "enp7th0f6f5gfgsjkjh9"
    "route_table_id" = ""
    "timeouts" = null /* object */
    "v4_cidr_blocks" = tolist([
      "10.0.1.0/24",
    ])
    "v6_cidr_blocks" = tolist([])
    "zone" = "ru-central1-a"
  }
}
```

4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.[main.tf](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/src/main.tf)
5. Сгенерируйте документацию к модулю с помощью terraform-docs.

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы работы с Terraform/src$ sudo snap install terraform-docs
[sudo] пароль для abramov: 
terraform-docs 0.17.0 от Andrii (am6puk) установлен
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы работы с Terraform/src$ terraform-docs markdown . > README.md
```

[README.md](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/04_%D0%9F%D1%80%D0%BE%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8B%D0%B5%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D1%81%20Terraform/src/README.md)    

Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```

### Задание 3
1. Выведите список ресурсов в стейте.

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы работы с Terraform/src$ terraform state list
data.template_file.cloudinit
module.test-vm.data.yandex_compute_image.my_image
module.test-vm.yandex_compute_instance.vm[0]
module.test-vm.yandex_compute_instance.vm[1]
module.vpc_dev.yandex_vpc_network.network
module.vpc_dev.yandex_vpc_subnet.subnet
```

2. Полностью удалите из стейта модуль vpc.

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform state rm module.vpc_dev
Removed module.vpc_dev.yandex_vpc_network.network
Removed module.vpc_dev.yandex_vpc_subnet.subnet
Successfully removed 2 resource instance(s).
```

3. Полностью удалите из стейта модуль vm.

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform state rm module.test-vm
Removed module.test-vm.data.yandex_compute_image.my_image
Removed module.test-vm.yandex_compute_instance.vm[0]
Removed module.test-vm.yandex_compute_instance.vm[1]
Successfully removed 3 resource instance(s).
```

4. Импортируйте всё обратно. 

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform import module.vpc_dev.yandex_vpc_network.network enp7th0f6f5gfgsjkjh9
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=264e6bb76c087f976618ddf77a6d393f8a3ad8cc1104ea6fee64c1c1b6d31331]
module.vpc_dev.yandex_vpc_network.network: Importing from ID "enp7th0f6f5gfgsjkjh9"...
module.vpc_dev.yandex_vpc_network.network: Import prepared!
module.test-vm.data.yandex_compute_image.my_image: Reading...
  Prepared yandex_vpc_network for import
module.vpc_dev.yandex_vpc_network.network: Refreshing state... [id=enp7th0f6f5gfgsjkjh9]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 2s [id=fd82qs98ootbak6lkmmj]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform import module.vpc_dev.yandex_vpc_subnet.subnet e9bsfv6jsoktmarpn5p5
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=264e6bb76c087f976618ddf77a6d393f8a3ad8cc1104ea6fee64c1c1b6d31331]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_subnet.subnet: Importing from ID "e9bsfv6jsoktmarpn5p5"...
module.vpc_dev.yandex_vpc_subnet.subnet: Import prepared!
  Prepared yandex_vpc_subnet for import
module.vpc_dev.yandex_vpc_subnet.subnet: Refreshing state... [id=e9bsfv6jsoktmarpn5p5]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 2s [id=fd82qs98ootbak6lkmmj]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform import module.test-vm.yandex_compute_instance.vm[0] fhm1krj6puvutta7lluk
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=264e6bb76c087f976618ddf77a6d393f8a3ad8cc1104ea6fee64c1c1b6d31331]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.test-vm.data.yandex_compute_image.my_image: Read complete after 2s [id=fd82qs98ootbak6lkmmj]
module.test-vm.yandex_compute_instance.vm[0]: Importing from ID "fhm1krj6puvutta7lluk"...
module.test-vm.yandex_compute_instance.vm[0]: Import prepared!
  Prepared yandex_compute_instance for import
module.test-vm.yandex_compute_instance.vm[0]: Refreshing state... [id=fhm1krj6puvutta7lluk]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform import module.test-vm.yandex_compute_instance.vm[1] fhm2hae6bul5f0se8et1
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=264e6bb76c087f976618ddf77a6d393f8a3ad8cc1104ea6fee64c1c1b6d31331]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.test-vm.data.yandex_compute_image.my_image: Read complete after 3s [id=fd82qs98ootbak6lkmmj]
module.test-vm.yandex_compute_instance.vm[1]: Importing from ID "fhm2hae6bul5f0se8et1"...
module.test-vm.yandex_compute_instance.vm[1]: Import prepared!
  Prepared yandex_compute_instance for import
module.test-vm.yandex_compute_instance.vm[1]: Refreshing state... [id=fhm2hae6bul5f0se8et1]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

Проверьте terraform plan. Изменений быть не должно.

```
abramov@abramov:~/netology/netology_hw/Облачная инфраструктура. Terraform/04_Продвинутые методы раб
оты с Terraform/src$ terraform plan
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=264e6bb76c087f976618ddf77a6d393f8a3ad8cc1104ea6fee64c1c1b6d31331]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_network.network: Refreshing state... [id=enp7th0f6f5gfgsjkjh9]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 2s [id=fd82qs98ootbak6lkmmj]
module.vpc_dev.yandex_vpc_subnet.subnet: Refreshing state... [id=e9bsfv6jsoktmarpn5p5]
module.test-vm.yandex_compute_instance.vm[0]: Refreshing state... [id=fhm1krj6puvutta7lluk]
module.test-vm.yandex_compute_instance.vm[1]: Refreshing state... [id=fhm2hae6bul5f0se8et1]

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # module.test-vm.yandex_compute_instance.vm[0] will be updated in-place
  ~ resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
        id                        = "fhm1krj6puvutta7lluk"
        name                      = "develop-web-0"
        # (11 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

  # module.test-vm.yandex_compute_instance.vm[1] will be updated in-place
  ~ resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
        id                        = "fhm2hae6bul5f0se8et1"
        name                      = "develop-web-1"
        # (11 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 2 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take
exactly these actions if you run "terraform apply" now.
```

Приложите список выполненных команд и скриншоты процессы.

## Дополнительные задания (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.**   Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 


### Задание 4*

1. Измените модуль vpc так, чтобы он мог создать подсети во всех зонах доступности, переданных в переменной типа list(object) при вызове модуля.  
  
Пример вызова
```
module "vpc_prod" {
  source       = "./vpc"
  env_name     = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
}

module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}
```

Предоставьте код, план выполнения, результат из консоли YC.

### Задание 5*

1. Напишите модуль для создания кластера managed БД Mysql в Yandex Cloud с одним или несколькими(2 по умолчанию) хостами в зависимости от переменной HA=true или HA=false. Используйте ресурс yandex_mdb_mysql_cluster: передайте имя кластера и id сети.
2. Напишите модуль для создания базы данных и пользователя в уже существующем кластере managed БД Mysql. Используйте ресурсы yandex_mdb_mysql_database и yandex_mdb_mysql_user: передайте имя базы данных, имя пользователя и id кластера при вызове модуля.
3. Используя оба модуля, создайте кластер example из одного хоста, а затем добавьте в него БД test и пользователя app. Затем измените переменную и превратите сингл хост в кластер из 2-х серверов.
4. Предоставьте план выполнения и по возможности результат. Сразу же удаляйте созданные ресурсы, так как кластер может стоить очень дорого. Используйте минимальную конфигурацию.

### Задание 6*

1. Разверните у себя локально vault, используя docker-compose.yml в проекте.
2. Для входа в web-интерфейс и авторизации terraform в vault используйте токен "education".
3. Создайте новый секрет по пути http://127.0.0.1:8200/ui/vault/secrets/secret/create
Path: example  
secret data key: test 
secret data value: congrats!  
4. Считайте этот секрет с помощью terraform и выведите его в output по примеру:
```
provider "vault" {
 address = "http://<IP_ADDRESS>:<PORT_NUMBER>"
 skip_tls_verify = true
 token = "education"
}
data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}

output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 

Можно обратиться не к словарю, а конкретному ключу:
terraform console: >nonsensitive(data.vault_generic_secret.vault_example.data.<имя ключа в секрете>)
```
5. Попробуйте самостоятельно разобраться в документации и записать новый секрет в vault с помощью terraform. 

### Задание 7*
Попробуйте самостоятельно разобраться в документаци и с помощью terraform remote state разделить корневой модуль на два отдельных: создание VPC от создание ВМ в этом vpc. 

### Правила приёма работы

В своём git-репозитории создайте новую ветку terraform-04, закоммитьте в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформите в md-файле в ветке terraform-04.

В качестве результата прикрепите ссылку на ветку terraform-04 в вашем репозитории.

**Важно.** Удалите все созданные ресурсы.

### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки. 




