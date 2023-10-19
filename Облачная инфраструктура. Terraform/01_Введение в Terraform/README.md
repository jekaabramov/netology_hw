# 01 "Введение в Terraform" - Абрамов Е. Э.

#### Чек-лист 
Скачайте и установите Terraform версии =1.5.5 (версия 1.6 может вызывать проблемы с Яндекс провайдером) . Приложите скриншот вывода команды terraform --version.


### Задание 1

1.

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
