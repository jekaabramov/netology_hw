# 12.2  «Работа с данными (DDL/DML)» - Абрамов Е. Э.

### Задание 1

1.2 CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY '123456';


1.3 select user from mysql.user;


1.4 GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost';

1.5 show grants for sys_temp@localhost;

1.6 ALTER USER 'sys_temp'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

1.8 show tables;


### Задание 2

