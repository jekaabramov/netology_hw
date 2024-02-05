# MySQL - Абрамов Евгений

## Задание 1

```bash
mysql> status

mysql  Ver 8.1.0 for Linux on x86_64 (MySQL Community Server - GPL)

Connection id:          21
Current database:       test_db
Current user:           root@localhost
SSL:                    Not in use    
Current pager:          stdout        
Using outfile:          ''
Using delimiter:        ;
Server version:         8.1.0 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    latin1
Conn.  characterset:    latin1
UNIX socket:            /var/run/mysqld/mysqld.sock
Binary data as:         Hexadecimal
Uptime:                 42 min 13 sec

Threads: 2  Questions: 132  Slow queries: 0  Opens: 192  Flush tables: 3  Open tables: 110  Queries per second avg: 0.052

mysql> SELECT COUNT(*) FROM orders WHERE price > 300;
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.01 sec)
```

## Задание 2

```bash
mysql> SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES WHERE USER = 'test' AND HOST = 'localhost';
+------+-----------+------------------------------------------------+
| USER | HOST      | ATTRIBUTE                                      |
+------+-----------+------------------------------------------------+
| test | localhost | {"LAST_NAME": "Pretty", "FIRST_NAME": "James"} |
+------+-----------+------------------------------------------------+
1 row in set (0.00 sec)
```

## Задание 3

```bash
mysql> SHOW TABLE STATUS\G

         Name: orders  
         Engine: InnoDB  
        Version: 10  
     Row_format: Dynamic   
           Rows: 5  
 Avg_row_length: 3276  
    Data_length: 16384  
Max_data_length: 0  
   Index_length: 0  
      Data_free: 0  
 Auto_increment: 6
    Create_time: 2023-08-21 13:19:42
    Update_time: 2023-08-21 13:19:42
     Check_time: NULL
      Collation: utf8mb4_0900_ai_ci
       Checksum: NULL
 Create_options:
        Comment:
1 row in set (0.01 sec)
```

```bash  
SET profiling = 1;
ALTER TABLE test_db.orders ENGINE = MyISAM;
ALTER TABLE test_db.orders ENGINE = InnoDB;
mysql> SHOW PROFILES;
+----------+------------+--------------------------------------------+
| Query_ID | Duration   | Query                                      |
+----------+------------+--------------------------------------------+
|        1 | 0.02609950 | SHOW TABLE STATUS                          |
|        2 | 0.00013350 | SET profiling = 1                          |
|        3 | 0.07141950 | ALTER TABLE test_db.orders ENGINE = MyISAM |
|        4 | 0.03926175 | ALTER TABLE test_db.orders ENGINE = InnoDB |
+----------+------------+--------------------------------------------+
4 rows in set, 1 warning (0.00 sec)
```

## Задание 4

```bash
innodb_buffer_pool_size = 70%   
innodb_io_capacity = 10000      
innodb_compression_algorithm = zlib
innodb_compression_level = 6
innodb_log_buffer_size = 1M
innodb_buffer_pool_size = 30%  l

log_bin = /var/log/mysql/mysql-bin.log
max_binlog_size = 100M

skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
secure-file-priv=/var/lib/mysql-files
user=mysql

pid-file=/var/run/mysqld/mysqld.pid
[client]
socket=/var/run/mysqld/mysqld.sock

!includedir /etc/mysql/conf.d/
```
