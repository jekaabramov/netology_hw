# Домашнее задание к занятию «Управляющие конструкции в коде Terraform» - Абрамов Евегенийсв

### Задание 1

1. Изучите проект.
2. Заполните файл personal.auto.tfvars.
3. Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/img/01.png)

### Задание 2

1. Создайте файл [count-vm.tf](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/src/count-vm.tf). Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )  
  
2. Создайте файл [for-each-vm.tf](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/src/for_each-vm.tf). Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" **разных** по cpu/ram/disk , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа:

``
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk=number }))
}
``

При желании внесите в переменную все возможные параметры.  
[

4. ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2.
В Terraform порядок создания ресурсов определяется в зависимости от зависимостей между ними. В данном случае, чтобы виртуальные машины из пункта 2.1 создавались после виртуальных машин из пункта 2.2. Когда Terraform видит зависимость между ресурсами, он автоматически управляет порядком их создания. В вашем случае, важно учесть, что Terraform будет учитывать зависимости, определенные в блоках ресурсов.
5. Используйте функцию file в local-переменной ([local.tf](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/src/locals.tf))для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
6. Инициализируйте проект, выполните код.

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/img/02.png)
------

### Задание 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле [disk_vm.tf](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/src/disk_vm.tf) .  

''
resource "yandex_compute_disk" "storage_disk" {
  count     = 3
  name      = "storage-disk-${count.index + 1}"
  folder_id = var.folder_id
  size      = 1
  zone      = var.default_zone

  labels = {
    environment = "production"
  }
}
''

2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

''
resource "yandex_compute_instance" "storage" {
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
''

------

### Задание 4

1. В файле [absible.tf](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/src/ansible.tf) создайте inventory-файл для ansible.
Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demonstration2).
Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
2. Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
3. Добавьте в инвентарь переменную  [**fqdn**](https://cloud.yandex.ru/docs/compute/concepts/network#hostname).
``` 
[webservers]
web-1 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
web-2 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[databases]
main ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
replica ansible_host<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[storage]
storage ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
```
Пример fqdn: ```web1.ru-central1.internal```(в случае указания имени ВМ); ```fhm8k1oojmm5lie8i22a.auto.internal```(в случае автоматической генерации имени ВМ зона изменяется). ужную вам переменную найдите в документации провайдера или terraform console.
4. Выполните код. Приложите скриншот получившегося файла.\
![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/img/03.png)
Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на [коммит](https://github.com/jekaabramov/netology_hw/tree/terraform-03/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/03_%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/src).   
**Удалите все созданные ресурсы**.

------

## Дополнительные задания (со звездочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Они помогут глубже разобраться в материале.
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию.

### Задание 5* (необязательное)

1. Напишите output, который отобразит все 5 созданных ВМ в виде списка словарей:

```
[
 {
  "name" = 'имя ВМ1'
  "id"   = 'идентификатор ВМ1'
  "fqdn" = 'Внутренний FQDN ВМ1'
 },
 {
  "name" = 'имя ВМ2'
  "id"   = 'идентификатор ВМ2'
  "fqdn" = 'Внутренний FQDN ВМ2'
 },
 ....
]
```

Приложите скриншот вывода команды ```terrafrom output```.

```

Outputs:

vm_list = [
  {
    "fqdn" = {
      "dns_record" = tolist([])
      "index" = 0
      "ip_address" = "10.0.1.12"
      "ipv4" = true
      "ipv6" = false
      "ipv6_address" = ""
      "ipv6_dns_record" = tolist([])
      "mac_address" = "d0:0d:1b:48:b6:9a"
      "nat" = true
      "nat_dns_record" = tolist([])
      "nat_ip_address" = "84.201.172.19"
      "nat_ip_version" = "IPV4"
      "security_group_ids" = toset([
        "enp3a9kli0t89srp56do",
      ])
      "subnet_id" = "e9bhn8rn4jc31sdheanh"
    }
    "id" = "fhmr92r9lb6s73i53a2k"
    "name" = "web-1"
  },
  {
    "fqdn" = {
      "dns_record" = tolist([])
      "index" = 0
      "ip_address" = "10.0.1.18"
      "ipv4" = true
      "ipv6" = false
      "ipv6_address" = ""
      "ipv6_dns_record" = tolist([])
      "mac_address" = "d0:0d:7e:fb:89:d1"
      "nat" = true
      "nat_dns_record" = tolist([])
      "nat_ip_address" = "158.160.38.248"
      "nat_ip_version" = "IPV4"
      "security_group_ids" = toset([
        "enp3a9kli0t89srp56do",
      ])
      "subnet_id" = "e9bhn8rn4jc31sdheanh"
    }
    "id" = "fhm7tus9q5qkrerldglm"
    "name" = "web-2"
  },
  {
    "fqdn" = {
      "dns_record" = tolist([])
      "index" = 0
      "ip_address" = "10.0.1.26"
      "ipv4" = true
      "ipv6" = false
      "ipv6_address" = ""
      "ipv6_dns_record" = tolist([])
      "mac_address" = "d0:0d:14:2a:58:d8"
      "nat" = true
      "nat_dns_record" = tolist([])
      "nat_ip_address" = "51.250.15.216"
      "nat_ip_version" = "IPV4"
      "security_group_ids" = toset([
        "enp3a9kli0t89srp56do",
      ])
      "subnet_id" = "e9bhn8rn4jc31sdheanh"
    }
    "id" = "fhmk59cdgq0k8bmesdq6"
    "name" = "main"
  },
  {
    "fqdn" = {
      "dns_record" = tolist([])
      "index" = 0
      "ip_address" = "10.0.1.16"
      "ipv4" = true
      "ipv6" = false
      "ipv6_address" = ""
      "ipv6_dns_record" = tolist([])
      "mac_address" = "d0:0d:12:03:c4:38"
      "nat" = true
      "nat_dns_record" = tolist([])
      "nat_ip_address" = "158.160.58.215"
      "nat_ip_version" = "IPV4"
      "security_group_ids" = toset([
        "enp3a9kli0t89srp56do",
      ])
      "subnet_id" = "e9bhn8rn4jc31sdheanh"
    }
    "id" = "fhmi0f23gn9ag9gim1mf"
    "name" = "replica"
  },
]

```

------

### Задание 6* (необязательное)

1. Используя null_resource и local-exec, примените ansible-playbook к ВМ из ansible inventory-файла.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/demonstration2).
3. Дополните файл шаблон hosts.tftpl.
Формат готового файла:
```netology-develop-platform-web-0   ansible_host="<внешний IP-address или внутренний IP-address если у ВМ отсутвует внешний адрес>"```

Для проверки работы уберите у ВМ внешние адреса. Этот вариант используется при работе через bastion-сервер.
Для зачёта предоставьте код вместе с основной частью задания.

### Правила приёма работы

В своём git-репозитории создайте новую ветку terraform-03, закоммитьте в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформите в md-файле в ветке terraform-03.

В качестве результата прикрепите ссылку на ветку terraform-03 в вашем репозитории.

Важно. Удалите все созданные ресурсы.

### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки.
