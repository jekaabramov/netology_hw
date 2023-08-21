# Типы и структура СУБД - Абрамов Евгений

### Задание 1

``\l`` - вывода списка БД  
``\c <имя_базы_данных>`` - подключения к БД  
``\dt`` - вывода списка таблиц  
``\d <имя_таблицы>``- вывода описания содержимого таблиц  
 ``\q`` - выхода из psql

 ### Задание 2

```
test_database=# ANALYZE orders;
ANALYZE
test_database=# SELECT attname, avg_width
test_database-# FROM pg_stats
test_database-# WHERE schemaname = 'public' AND tablename = 'orders'
test_database-# ORDER BY avg_width DESC
test_database-# LIMIT 1;
 attname | avg_width 
---------+-----------
 title   |        16
(1 row)
```
