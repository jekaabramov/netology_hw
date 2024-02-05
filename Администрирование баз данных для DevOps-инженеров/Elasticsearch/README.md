# Elasticsearch - Абрамов Евгений

## Задание 1

- Dockerfile

```docker
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

[Docker Hub](https://hub.docker.com/r/evgeniyabramov/elasticsearch-8.9)

```bash
# curl http://localhost:9200/
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

## Задание 2

- Добавьте в elasticsearch 3 индекса

```bash
curl -X PUT "localhost:9200/ind-1" -H "Content-Type: application/json" -d '{
  "settings": {
    "number_of_replicas": 0,
    "number_of_shards": 1
  }
}'

curl -X PUT "localhost:9200/ind-2" -H "Content-Type: application/json" -d '{
  "settings": {
    "number_of_replicas": 1,
    "number_of_shards": 2
  }
}'

curl -X PUT "localhost:9200/ind-3" -H "Content-Type: application/json" -d '{
  "settings": {
    "number_of_replicas": 2,
    "number_of_shards": 4
  }
}'
```

- Получите список индексов и их статусов

```bash
# curl -X GET "localhost:9200/_cat/indices?v"
health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   ind-1 g23TbcQrRm2bMbe221Ht3A   1   0          0            0       225b           225b
yellow open   ind-3 ZmoVM5PURju2OLqwsJt_LA   4   2          0            0       900b           900b
yellow open   ind-2 sjjCduTVTY-GC_PgJTeREA   2   1          0            0       450b           450b
```

- Получите состояние кластера Elasticsearch, используя API

```bash
# curl -X GET -u undefined:$ESPASS "localhost:9200/_cluster/health?pretty"
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

- Как вы думаете, почему часть индексов и кластер находятся в состоянии yellow?

Часть индексов и кластер находятся в состоянии "yellow", потому что Elasticsearch требует, чтобы хотя бы один реплицированный шард для каждого индекса был доступен для обеспечения высокой доступности данных.

- Удалите все индексы

```bash
# curl -X GET "localhost:9200/_cat/indices" | awk '{print $3}' | xargs -I {} curl -X DELETE "localhost:9200/{}"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed  
100   177    0   177    0     0  11062      0 --:--:-- --:--:-- --:--:-- 11062 
{"acknowledged":true}
{"acknowledged":true}
{"acknowledged":true}
```

## Задание 3

- Используя API, зарегистрируйте эту директорию как snapshot repository c именем netology_backup

```bash
# curl -X PUT -u undefined:$ESPASS "localhost:9200/_snapshot/netology_backup?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "snapshots"
  }
}'
{
  "acknowledged" : true
}
```

- Создайте индекс test с 0 реплик и 1 шардом и приведите в ответе список индексов

```bash
# curl -X GET "localhost:9200/_cat/indices?v"
health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   test  ZVDipuCkTCCcTcYcd3OIyg   1   0          0            0       225b           225b
```

- Создайте snapshot состояния кластера Elasticsearch

```bash
bash-4.2$ cd snapshots/
bash-4.2$ ls -la
total 48
drwxr-xr-x 3 elastic elastic  4096 Sep  4 07:53 .
drwxr-xr-x 1 elastic elastic  4096 Sep  4 07:49 ..
-rw-r--r-- 1 elastic elastic   587 Sep  4 07:53 index-0
-rw-r--r-- 1 elastic elastic     8 Sep  4 07:53 index.latest
drwxr-xr-x 3 elastic elastic  4096 Sep  4 07:53 indices
-rw-r--r-- 1 elastic elastic 21300 Sep  4 07:53 meta-qGlwyKJ4Q7GwUIAy3Qp2FA.dat
-rw-r--r-- 1 elastic elastic   303 Sep  4 07:53 snap-qGlwyKJ4Q7GwUIAy3Qp2FA.dat
```

- Удалите индекс test и создайте индекс test-2

```bash
# curl -X GET "localhost:9200/_cat/indices?v"
health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   test-2 FtxgM99XT8C9zWeY6-TX2Q   1   0          0            0       225b           225b
```

- Восстановите состояние кластера Elasticsearch из snapshot, созданного ранее

```bash
# curl -X POST "localhost:9200/_snapshot/netology_backup/my_snapshot/_restore" -H 'Content-Type: application/json' -d'
{
  "indices": "test",
  "ignore_unavailable": true,
  "include_global_state": false
}'

# curl -X GET "localhost:9200/_cat/indices?v"
health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   test-2 FtxgM99XT8C9zWeY6-TX2Q   1   0          0            0       247b           247b
green  open   test   jyuU9E25TRSBZHjrPyVL9g   1   0          0            0       247b           247b
```
