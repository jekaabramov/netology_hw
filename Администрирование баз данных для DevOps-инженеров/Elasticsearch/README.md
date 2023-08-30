# Elasticsearch - Абрамов Евгений

### Задание 1
```
# Используем базовый образ CentOS 7
FROM centos:7

# Установка необходимых пакетов
RUN yum update -y && yum install -y java-1.8.0-openjdk which

# Создание директории для установки Elasticsearch
WORKDIR /usr/share

# Скачивание и установка Elasticsearch
RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.0-linux-x86_64.tar.gz && \
    tar -xvf elasticsearch-7.10.0-linux-x86_64.tar.gz && \
    mv elasticsearch-7.10.0 elasticsearch && \
    rm elasticsearch-7.10.0-linux-x86_64.tar.gz

# Копирование настроек Elasticsearch
COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Создание директории для данных
RUN mkdir -p /var/lib/elasticsearch

# Установка пакета perl-Digest-SHA
RUN yum install -y perl-Digest-SHA

# Задание рабочей директории
WORKDIR /usr/share/elasticsearch

# Запуск Elasticsearch
CMD ["bin/elasticsearch"]
```





### Задание 2

### Задание 3

### Задание 4
