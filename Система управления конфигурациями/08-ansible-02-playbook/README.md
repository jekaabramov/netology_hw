# Домашнее задание к занятию 2 «Работа с Playbook» - Абрамов Евгений

1. Подготовьте свой inventory-файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

```bash
$ 
ansible-lint site.yml
WARNING  Overriding detected file kind 'yaml' with 'playbook' for given positional argument: site.yml
an AnsibleCollectionFinder has not been installed in this process
```

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

```bash
 
ansible-playbook -i inventory/prod.yml site.yml --check

PLAY [Install Clickhouse] *******************************************************************************

TASK [Gathering Facts] **********************************************************************************
The authenticity of host '178.154.204.76 (178.154.204.76)' can't be established.
ED25519 key fingerprint is SHA256:Q9LiAe/lLPyxyYBeljBG2W3siAcMGlDW6pCOkewVM9U.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [clickhouse-01]

TASK [Get clickhouse distrib] ***************************************************************************
changed: [clickhouse-01] => (item=clickhouse-client)
changed: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "item": "clickhouse-common-static", "msg": "Request failed", "response": "HTTP Error 404: Not Found", "status_code": 404, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ***************************************************************************
changed: [clickhouse-01]

TASK [Install clickhouse packages] **********************************************************************
fatal: [clickhouse-01]: FAILED! => {"changed": false, "msg": "No RPM file matching 'clickhouse-common-static-22.3.3.44.rpm' found on system", "rc": 127, "results": ["No RPM file matching 'clickhouse-common-static-22.3.3.44.rpm' found on system"]}

PLAY RECAP **********************************************************************************************
clickhouse-01              : ok=2    changed=1    unreachable=0    failed=1    skipped=0    rescued=1    ignored=0
```

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

```bash
$ 
ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse] *******************************************************************************

TASK [Gathering Facts] **********************************************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] ***************************************************************************
changed: [clickhouse-01] => (item=clickhouse-client)
changed: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "item": "clickhouse-common-static", "msg": "Request failed", "response": "HTTP Error 404: Not Found", "status_code": 404, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ***************************************************************************
changed: [clickhouse-01]

TASK [Install clickhouse packages] **********************************************************************
changed: [clickhouse-01]

TASK [Flush handlers] ***********************************************************************************

RUNNING HANDLER [Start clickhouse service] **************************************************************
changed: [clickhouse-01]

TASK [Create database] **********************************************************************************
changed: [clickhouse-01]

PLAY [Install Vector] ***********************************************************************************

TASK [Gathering Facts] **********************************************************************************
The authenticity of host '178.154.200.206 (178.154.200.206)' can't be established.
ED25519 key fingerprint is SHA256:qEKuHh5n4WQ5T1W/WFCEvhLjtq/Hq4d42JotNnkbWUM.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [vector-01]

TASK [Install Vector] ***********************************************************************************
changed: [vector-01]

TASK [Configure Vector | ensure what directory exists] **************************************************
--- before
+++ after
@@ -1,5 +1,5 @@
 {
-    "mode": "0755",
+    "mode": "0644",
     "path": "/home/centos/vector_config",
-    "state": "absent"
+    "state": "directory"
 }

changed: [vector-01]

TASK [Configure Vector | Template config] ***************************************************************
--- before
+++ after: /home/abramov/.ansible/tmp/ansible-local-39309c6e0y90f/tmpg68wa2un/vector.yml.j2
@@ -0,0 +1,2 @@
+---
+null

changed: [vector-01]

TASK [Configure Service] ********************************************************************************
--- before
+++ after: /home/abramov/.ansible/tmp/ansible-local-39309c6e0y90f/tmpm6ymo2mh/vector.service.j2
@@ -0,0 +1,10 @@
+[Unit]
+Description=Vector Service
+After=network.target
+Requires=network-online.target
+[Service]
+User=centos
+Group=1000
+ExecStart=/usr/bin/vector --config-yaml /home/centos/vector_config/vector.yml --watch-config true
+Restart=always
+WantedBy=multi-user.target%

changed: [vector-01]

RUNNING HANDLER [Restart Vector] ************************************************************************
changed: [vector-01]

PLAY RECAP **********************************************************************************************
clickhouse-01              : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0   
vector-01                  : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

```bash
$ 
ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [Install Clickhouse] *******************************************************************************

TASK [Gathering Facts] **********************************************************************************
ok: [clickhouse-01]

TASK [Get clickhouse distrib] ***************************************************************************
ok: [clickhouse-01] => (item=clickhouse-client)
ok: [clickhouse-01] => (item=clickhouse-server)
failed: [clickhouse-01] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "gid": 1000, "group": "centos", "item": "clickhouse-common-static", "mode": "0664", "msg": "Request failed", "owner": "centos", "response": "HTTP Error 404: Not Found", "secontext": "unconfined_u:object_r:user_home_t:s0", "size": 246310036, "state": "file", "status_code": 404, "uid": 1000, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ***************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse packages] **********************************************************************
ok: [clickhouse-01]

TASK [Flush handlers] ***********************************************************************************

TASK [Create database] **********************************************************************************
ok: [clickhouse-01]

PLAY [Install Vector] ***********************************************************************************

TASK [Gathering Facts] **********************************************************************************
ok: [vector-01]

TASK [Install Vector] ***********************************************************************************
ok: [vector-01]

TASK [Configure Vector | ensure what directory exists] **************************************************
ok: [vector-01]

TASK [Configure Vector | Template config] ***************************************************************
ok: [vector-01]

TASK [Configure Service] ********************************************************************************
ok: [vector-01]

PLAY RECAP **********************************************************************************************
clickhouse-01              : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0   
vector-01                  : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

9. Подготовьте [README.md-файл]() по своему [playbook](). В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
