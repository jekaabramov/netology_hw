# Ansible Playbook для установки ClickHouse, Vector, NGINX и Lighthouse

Этот Ansible playbook автоматизирует установку и настройку ClickHouse, Vector, NGINX и Lighthouse на указанных хостах.

## Что делает плейбук

### Установка ClickHouse
- Загружает дистрибутив ClickHouse с официального репозитория.
- Устанавливает пакеты ClickHouse (common-static, client, server).
- Запускает службу ClickHouse.
- Создает базу данных "logs".

### Установка Vector
- Устанавливает пакет Vector из официального репозитория Timber.io.
- Перезапускает службу Vector.
- Настраивает каталог конфигурации для Vector.
- Заполняет файл конфигурации Vector (`vector.yml`) с использованием шаблона.
- Настраивает systemd-службу для Vector.

### Установка NGINX
- Устанавливает epel-release для доступа к пакетам.
- Устанавливает пакет NGINX.
- Запускает NGINX и настраивает его.

### Установка Lighthouse
- Устанавливает зависимость git.
- Копирует Lighthouse из репозитория.
- Создает конфигурацию Lighthouse.
- Перезапускает NGINX для применения изменений.

## Параметры и теги

### Параметры
- Для ClickHouse: `clickhouse_version`, `clickhouse_packages`.
- Для Vector: `vector_version`, `ansible_architecture`, `vector_config_dir`.
- Для NGINX: Нет явных параметров.
- Для Lighthouse: `lighthouse_vcs`, `lighthouse_location_dir`.

### Теги
- `Start clickhouse service`: Запуск службы ClickHouse.
- `Restart Vector`: Перезапуск службы Vector.
- `start-nginx`: Запуск NGINX.
- `reload-nginx`: Перезагрузка NGINX.

## Пример использования

1. Создайте файл инвентаря (`your_inventory_file.yml`) с необходимыми группами хостов (`clickhouse`, `vector`, `lighthouse`).
2. Измените переменные в плейбуке согласно вашему окружению.
3. Запустите плейбук:

```bash
ansible-playbook -i your_inventory_file.yml your_playbook_file.yml
