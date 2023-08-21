# PostgreSQL - Абрамов Евгений

### Задача 1

``\l`` - вывода списка БД  
``\c <имя_базы_данных>`` - подключения к БД  
``\dt`` - вывода списка таблиц  
``\d <имя_таблицы>``- вывода описания содержимого таблиц  
 ``\q`` - выхода из psql

 ### Задача 2

```
test_database=# ANALYZE orders;
ANALYZE
test_database=# SELECT attname, avg_width
FROM pg_stats
WHERE schemaname = 'public' AND tablename = 'orders'
ORDER BY avg_width DESC
LIMIT 1;
 attname | avg_width 
---------+-----------
 title   |        16
(1 row)
```

### Задача 3
```
BEGIN;

-- Создание таблицы orders_1
CREATE TABLE orders_1 AS
SELECT * FROM orders WHERE price > 499;

-- Создание таблицы orders_2
CREATE TABLE orders_2 AS
SELECT * FROM orders WHERE price <= 499;

-- Перенос данных в orders_1 и orders_2
INSERT INTO orders_1 SELECT * FROM orders WHERE price > 499;
INSERT INTO orders_2 SELECT * FROM orders WHERE price <= 499;

-- Удаление данных из оригинальной таблицы
DELETE FROM orders WHERE price > 499;
DELETE FROM orders WHERE price <= 499;

COMMIT;
```
Можно ли было изначально исключить “ручное” разбиение при проектировании таблицы orders?

Можно, если изначально известное распределение по какому-то из полей, что бывает крайне редко.
Если мы заранее знаем, что кол-во записей в БД будет равномерно распредлено по какому-то полю, то шардировать можно при проектировании. Иначе можем получить ситуацию когда на одном шарде 99% записей, на другом 1%

### Задача 4

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца title для таблиц test_database?
Можно прямо в создание partitions добавить директиву UNIQUE напротив объявления полей таблицы:
```
CREATE TABLE public.orders_price_lte_499 (
    id integer DEFAULT nextval('public.orders_new_id_seq'::regclass) NOT NULL,
    title character varying(80) NOT NULL UNIQUE,
    price integer DEFAULT 0
);

CREATE TABLE public.orders_price_gt_499 (
    id integer DEFAULT nextval('public.orders_new_id_seq'::regclass) NOT NULL,
    title character varying(80) NOT NULL UNIQUE,
    price integer DEFAULT 0
);
```
При разворацивании такого дампа title станет уникальным полем