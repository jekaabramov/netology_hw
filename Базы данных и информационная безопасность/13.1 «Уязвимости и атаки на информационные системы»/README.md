13.1 «Уязвимости и атаки на информационные системы» - Абрамов Евгений

### Задание 1

Разрешены следующие сетевые службы

| PORT | STATE | SERVICE | VERSION |
| 21/tcp | open | ftp | vsftpd 2.3.4 |
22/tcp   open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)  
23/tcp   open  telnet      Linux telnetd  
25/tcp   open  smtp        Postfix smtpd  
53/tcp   open  domain      ISC BIND 9.4.2  
80/tcp   open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)  
111/tcp  open  rpcbind     2 (RPC #100000)  
139/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)   
445/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)   
512/tcp  open  exec        netkit-rsh rexecd  
513/tcp  open  login       OpenBSD or Solaris rlogind  
514/tcp  open  shell       Netkit rshd  
1099/tcp open  java-rmi    GNU Classpath grmiregistry  
1524/tcp open  bindshell   Metasploitable root shell  
2049/tcp open  nfs         2-4 (RPC #100003)  
2121/tcp open  ftp         ProFTPD 1.3.1  
3306/tcp open  mysql       MySQL 5.0.51a-3ubuntu5  
5432/tcp open  postgresql  PostgreSQL DB 8.3.0 - 8.3.7  
5900/tcp open  vnc         VNC (protocol 3.3)  
6000/tcp open  X11         (access denied)  
6667/tcp open  irc         UnrealIRCd  
8009/tcp open  ajp13       Apache Jserv (Protocol v1.3)  
8180/tcp open  http        Apache Tomcat/Coyote JSP engine 1.1  
  
https://www.exploit-db.com/exploits/17491  
https://www.exploit-db.com/exploits/35738  
https://www.exploit-db.com/exploits/49908  

### Задание 2

#### SYN-сканирование

* Nmap отправляет TCP-пакеты с установленным флагом SYN (синхронизация) на целевой порт.
* Если порт открыт, целевой хост отправляет ответный пакет с установленными флагами SYN и ACK (подтверждение).
* Nmap затем отправляет пакет с установленным флагом RST (сброс) для завершения соединения.

#### FIN-сканирование

* Nmap отправляет TCP-пакеты с установленным флагом FIN (завершение) на целевой порт.
* Если порт закрыт, целевой хост отправляет ответный пакет с установленным флагом RST (сброс).
* Если порт открыт, целевой хост игнорирует пакеты FIN и не отправляет ответ.
* Если порт закрыт, хост отправляет ответный пакет с флагом RST, а если порт открыт, хост не реагирует на пакеты FIN.

#### Xmas-сканирование

* Nmap отправляет TCP-пакеты с установленными флагами FIN, PSH (срочные данные) и URG (срочные данные).
* Если порт закрыт, целевой хост отправляет ответный пакет с установленным флагом RST (сброс).
* Если порт открыт, целевой хост игнорирует пакеты Xmas и не отправляет ответ.

#### UDP-сканирование

* Nmap отправляет UDP-пакеты на целевой порт без установки флагов SYN или FIN.
* Если порт закрыт, целевой хост отправляет ответный пакет с установленным флагом ICMP (например, порт недостижимости).
* Если порт открыт, целевой хост может не отправить никакого ответа или отправить ответ с установленным флагом UDP (например, порт открыт).
* UDP-сканирование используется для определения открытых UDP-портов на целевом хосте.