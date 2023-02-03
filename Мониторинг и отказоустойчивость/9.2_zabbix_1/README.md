9.2 «Zabbix. Часть 1»

### Задание 1



1. su -
2. apt install postgresql
3. wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4%2Bdebian11_all.deb
4. dpkg -i zabbix-release_6.0-4+debian11_all.deb
5. apt update
6. apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
7. su - postgres -c 'psql --command "CREATE USER zabbix WITH PASSWORD '\'123456789\'';"'
8. su - postgres -c 'psql --command "CREATE DATABASE zabbix OWNER zabbix;"' 
9. zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
10. nano /etc/zabbix/zabbix_server.conf
11. sudo systemctl restart zabbix-server apache2 # zabbix-agent

`При необходимости прикрепитe сюда скриншоты
![](ссылка на скриншот 1)`

### Задание 2


