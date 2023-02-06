# 9.2 «Zabbix. Часть 1» - Абрамов Е. Э.

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

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%B8%20%D0%BE%D1%82%D0%BA%D0%B0%D0%B7%D0%BE%D1%83%D1%81%D1%82%D0%BE%D0%B9%D1%87%D0%B8%D0%B2%D0%BE%D1%81%D1%82%D1%8C/9.2_zabbix_1/img/1_1.jpg)`

### Задание 2

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%B8%20%D0%BE%D1%82%D0%BA%D0%B0%D0%B7%D0%BE%D1%83%D1%81%D1%82%D0%BE%D0%B9%D1%87%D0%B8%D0%B2%D0%BE%D1%81%D1%82%D1%8C/9.2_zabbix_1/img/2_1.jpg)`

![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%B8%20%D0%BE%D1%82%D0%BA%D0%B0%D0%B7%D0%BE%D1%83%D1%81%D1%82%D0%BE%D0%B9%D1%87%D0%B8%D0%B2%D0%BE%D1%81%D1%82%D1%8C/9.2_zabbix_1/img/2_2.jpg)`


![](https://github.com/jekaabramov/netology_hw/blob/master/%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%B8%20%D0%BE%D1%82%D0%BA%D0%B0%D0%B7%D0%BE%D1%83%D1%81%D1%82%D0%BE%D0%B9%D1%87%D0%B8%D0%B2%D0%BE%D1%81%D1%82%D1%8C/9.2_zabbix_1/img/2_3.jpg)`

