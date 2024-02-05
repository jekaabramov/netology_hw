# SQL - Абрамов Евгений

## Задание 1

```bash
docker run -d \
  --name postgres12 \
  -e POSTGRES_PASSWORD=2310615 \
  -v /home/vagrant/pg_data:/var/lib/postgresql/data \
  -v /home/vagrant/pg_backups:/var/lib/postgresql/backups \
  -p 5432:5432 \
  postgres:12
```

## Задание 2

![ ](https://github.com/jekaabramov/netology_hw/blob/master/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B0%D0%B7%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B4%D0%BB%D1%8F%20DevOps-%D0%B8%D0%BD%D0%B6%D0%B5%D0%BD%D0%B5%D1%80%D0%BE%D0%B2/SQL/img/2-1.bmp)

![ ](https://github.com/jekaabramov/netology_hw/blob/master/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B0%D0%B7%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B4%D0%BB%D1%8F%20DevOps-%D0%B8%D0%BD%D0%B6%D0%B5%D0%BD%D0%B5%D1%80%D0%BE%D0%B2/SQL/img/2-2.bmp)

![ ](https://github.com/jekaabramov/netology_hw/blob/master/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B0%D0%B7%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B4%D0%BB%D1%8F%20DevOps-%D0%B8%D0%BD%D0%B6%D0%B5%D0%BD%D0%B5%D1%80%D0%BE%D0%B2/SQL/img/2-3.bmp)

![ ](https://github.com/jekaabramov/netology_hw/blob/master/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B0%D0%B7%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D0%B4%D0%BB%D1%8F%20DevOps-%D0%B8%D0%BD%D0%B6%D0%B5%D0%BD%D0%B5%D1%80%D0%BE%D0%B2/SQL/img/2-4.bmp)

### Задание 3

```sql
INSERT INTO orders (наименование, цена)
VALUES
    ('Шоколад', 10),
    ('Принтер', 3000),
    ('Книга', 500),
    ('Монитор', 7000),
    ('Гитара', 4000);
INSERT 0 5

test_db=# SELECT COUNT(*) FROM orders;
 count
-------
     5
(1 row)

INSERT INTO clients (фамилия, страна_проживания, заказ)
VALUES
    ('Иванов Иван Иванович', 'USA', 1),
    ('Петров Петр Петрович', 'Canada', 3),
    ('Иоганн Себастьян Бах', 'Japan', 5),
    ('Ронни Джеймс Дио', 'Russia', 4),
    ('Ritchie Blackmore', 'Russia', 2);
INSERT 0 5

test_db=# SELECT COUNT(*) FROM clients;
 count
-------
     5
(1 row)
```

### Задание 4

```sql
UPDATE clients
SET заказ = 3
WHERE фамилия = 'Иванов Иван Иванович';

UPDATE clients
SET заказ = 4
WHERE фамилия = 'Петров Петр Петрович';

UPDATE clients
SET заказ = 5
WHERE фамилия = 'Иоганн Себастьян Бах';

SELECT * FROM clients WHERE заказ IS NOT NULL;
```

### Задание 5

```sql
test_db=# EXPLAIN SELECT * FROM clients WHERE заказ IS NOT NULL;
                        QUERY PLAN
-----------------------------------------------------------
 Seq Scan on clients  (cost=0.00..18.10 rows=806 width=72)
   Filter: ("заказ" IS NOT NULL)
(2 rows)

QUERY PLAN: Это заголовок, указывающий на то, что следующие строки содержат информацию о плане выполнения запроса.

Seq Scan on clients: Это операция сканирования последовательности (поочередного чтения) таблицы clients.

cost=0.00..18.10: Это оценочные затраты на выполнение операции. Диапазон оценки затрат указан от минимального (0.00) до максимального (18.10) значения. В этом контексте оценочные затраты являются числовым показателем сложности выполнения операции.

rows=806: Это оценочное количество строк, которое будет обработано операцией.

width=72: Это оценочная ширина результата операции в байтах.

Filter: (заказ IS NOT NULL): Это фильтр, который применяется к результату операции сканирования. Он показывает, что фильтр применяется для выбора строк, где поле заказ не равно NULL.
```

### Задание 6

Бэкап БД

```bash
docker run --rm \
    -v /home/vagrant/pg_backups:/backups \
    -e PGPASSWORD=2310615 \
    postgres:12 \
    pg_dump -h 172.17.0.2 -U postgres -d test_db -F c -b -v -f /backups/test_db.backup
```

Восстановлени БД в новом контейнере

```bash
docker run --rm \
    -v /home/vagrant/pg_backups:/backups \
    -e PGPASSWORD=2310615 \
    postgres:12 \
    pg_restore -h 172.17.0.2 -U postgres -d test_db -v /backups/test_db.backup
```
