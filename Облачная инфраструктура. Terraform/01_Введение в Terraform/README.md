# 01 "Введение в Terraform" - Абрамов Е. Э.

#### Чек-лист 
Скачайте и установите Terraform версии =1.5.5 (версия 1.6 может вызывать проблемы с Яндекс провайдером) . Приложите скриншот вывода команды terraform --version.

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/01_%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20Terraform/img/0.png)

### Задание 1

1. ![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9E%D0%B1%D0%BB%D0%B0%D1%87%D0%BD%D0%B0%D1%8F%20%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.%20Terraform/01_%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20Terraform/img/1.png)

2. Согласно файлу .gitignore, допустимо сохранять личную и секретную информацию в файле personal.auto.tfvars.

3. Ключ: bcrypt_hash
Значение: $2a$10$EihxvK9.YGfavGJmyu.gxOXau/YZtZgpJg1hKHx32jFMEfg0pj8we

4. Ошибки в выводе `terraform validate`, указывают на то, что в ваших Terraform конфигурациях есть проблемы с определением ресурсов:

- 1. Ошибка "Missing name for resource" на строке 24:

   ```hcl
   resource "docker_image" {
   ```

   Terraform требует, чтобы каждый ресурс имел два обязательных аргумента: `type` и `name`.

- 2. Ошибка "Invalid resource name" на строке 29:

   ```hcl
   resource "docker_container" "1nginx" {
   ```

   Имя ресурса `docker_container` начинается с цифры ("1nginx"), что не допускается согласно синтаксису Terraform. Имена ресурсов должны начинаться с буквы или подчеркивания и могут содержать только буквы, цифры, подчеркивания и тире.
5. 
```hcl
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 8000
  }
}
```

```hcl
root@node1:/home/vagrant/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS          PORTS                  NAMES
9253caddbbe3   bc649bab30d1   "/docker-entrypoint.…"   About a minute ago   Up 59 seconds   0.0.0.0:8000->80/tcp   example_cXoS0gVjNHRPp0Ir
```
6. Ключ `-auto-approve` в Terraform используется для автоматического подтверждения (применения) изменений, сделанных в вашей инфраструктуре, без необходимости ручного подтверждения. Однако, его использование может быть опасным по нескольким причинам:

- 1. **Непредсказуемость изменений:** Когда вы используете `-auto-approve`, Terraform будет выполнять изменения без вашего активного подтверждения. Это может привести к непредсказуемому изменению вашей инфраструктуры, что может вызвать проблемы, если что-то пойдет не так.

- 2. **Невозможность просмотра изменений:** Вы не сможете предварительно оценить изменения, которые будут внесены в вашу инфраструктуру. Это может привести к нежелательным или даже разрушительным результатам.

- 3. **Безопасность:** Если в вашей инфраструктуре есть чувствительные данные или настройки, использование `-auto-approve` может привести к утечке данных или созданию уязвимостей, так как изменения могут быть выполнены без должного контроля.

- 4. **Откат сложен:** Если что-то пойдет не так или если изменения вызовут проблемы, откат (возврат к предыдущему состоянию) может быть сложным и требовать дополнительных действий.

Использование `-auto-approve` может быть полезным в некоторых ситуациях, например, в автоматизированных сценариях или в ходе непрерывной интеграции и непрерывной поставки (CI/CD), но следует осторожно использовать его и убедиться, что вы понимаете последствия его использования в вашей конкретной среде. Важно регулярно резервировать данные и иметь механизмы восстановления для минимизации рисков.
```
root@node1:/home/vagrant/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
acec162ab7ff   bc649bab30d1   "/docker-entrypoint.…"   20 seconds ago   Up 18 seconds   0.0.0.0:8000->80/tcp   example_cXoS0gVjNHRPp0Ir
```
7. 
```hcl
root@node1:/home/vagrant/ter-homeworks/01/src# cat terraform.tfstate
{
  "version": 4,
  "terraform_version": "1.5.5",
  "serial": 13,
  "lineage": "d5956c1f-2bc2-a189-52f1-f19b02aea29d",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
8. Для объяснения почему образ `nginx:latest` не был удалён, следует обратить внимание на параметр `keep_locally` в ресурсе `docker_image` в Terraform.

Из документации:

```
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
```

Параметр `keep_locally` определяет, должен ли Terraform сохранять локально скачанный Docker-образ после завершения операции `destroy`. Если он установлен в `true`, образ не будет удален, даже если выполнена операция уничтожения.

В конфигурации `keep_locally` был установлен в `true`, что означает, что образ `nginx:latest` не будет удален при выполнении `terraform destroy`.