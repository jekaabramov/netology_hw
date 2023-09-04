# Elasticsearch - Абрамов Евгений

### Задание 1

##### Dockerfile
```
# Используем базовый образ CentOS 7
FROM centos:7

# Установка необходимых пакетов (wget и perl-Digest-SHA)
RUN yum install wget perl-Digest-SHA -y

# Задание рабочей директории
WORKDIR /home/elasticsearch

# Скачивание Elasticsearch
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.9.1-linux-x86_64.tar.gz  && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.9.1-linux-x86_64.tar.gz.sha512 && \
    shasum -a 512 -c elasticsearch-8.9.1-linux-x86_64.tar.gz.sha512 && \
    tar -xzf elasticsearch-8.9.1-linux-x86_64.tar.gz

# Копирование конфигурационного файла
COPY ./elasticsearch.yml ./elasticsearch-8.9.1/config

RUN useradd -MU elastic && \
    chown -R elastic:elastic elasticsearch-8.9.1 && \
    mkdir /var/lib/elastic && \
    chown -R elastic:elastic /var/lib/elastic

# Переключение на пользователя elasticsearch
USER elastic

# Открытие порта 9200 для доступа к Elasticsearch
EXPOSE 9200
```
```
root@node1:~/elasticsearch# curl http://localhost:9200/
{
  "name" : "netology_test",
  "cluster_name" : "my_cluster",
  "cluster_uuid" : "rziMNF2cQKC0gyek-8pbNw",
  "version" : {
    "number" : "8.9.1",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "a813d015ef1826148d9d389bd1c0d781c6e349f0",
    "build_date" : "2023-08-10T05:02:32.517455352Z",
    "build_snapshot" : false,
    "lucene_version" : "9.7.0",
    "minimum_wire_compatibility_version" : "7.17.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "You Know, for Search"
}
```
### Задание 2

##### Получите список индексов и их статусов:
```
root@node1:~/elasticsearch# curl -X GET "localhost:9200/_cat/indices?v"
health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   ind-1 g23TbcQrRm2bMbe221Ht3A   1   0          0            0       225b           225b
yellow open   ind-3 ZmoVM5PURju2OLqwsJt_LA   4   2          0            0       900b           900b
yellow open   ind-2 sjjCduTVTY-GC_PgJTeREA   2   1          0            0       450b           450b
```
##### Получите состояние кластера Elasticsearch, используя API.
```
root@node1:~/elasticsearch# curl -X GET -u undefined:$ESPASS "localhost:9200/_cluster/health?pretty"
{
  "cluster_name" : "my_cluster",
  "status" : "yellow",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 7,
  "active_shards" : 7,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 10,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 41.17647058823529
}
```
##### Как вы думаете, почему часть индексов и кластер находятся в состоянии yellow?

Часть индексов и кластер находятся в состоянии "yellow", потому что Elasticsearch требует, чтобы хотя бы один реплицированный шард для каждого индекса был доступен для обеспечения высокой доступности данных.

#### Удалите все индексы
```
root@node1:~/elasticsearch# curl -X GET "localhost:9200/_cat/indices" | awk '{print $3}' | xargs -I {} curl -X DELETE "localhost:9200/{}"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed  
100   177    0   177    0     0  11062      0 --:--:-- --:--:-- --:--:-- 11062 
{"acknowledged":true}
{"acknowledged":true}
{"acknowledged":true}
```
### Задание 3



### Задание 4
