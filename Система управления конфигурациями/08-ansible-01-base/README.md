# Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
```bash
$ ansible-playbook -i ./inventory/test.yml site.yml 

PLAY [Print os facts] ********************************************************************

TASK [Gathering Facts] *******************************************************************
ok: [localhost]

TASK [Print OS] **************************************************************************
ok: [localhost] => {
    "msg": "Ubuntu"
}

TASK [Print fact] ************************************************************************
ok: [localhost] => {
    "msg": 12
}

PLAY RECAP *******************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
```bash
$ cat group_vars/all/examp.yml
---
  some_fact: all default fact

$ ansible-playbook -i ./inventory/test.yml site.yml

PLAY [Print os facts] ********************************************************************************

TASK [Gathering Facts] *******************************************************************************
ok: [localhost]

TASK [Print OS] **************************************************************************************
ok: [localhost] => {
    "msg": "Ubuntu"
}

TASK [Print fact] ************************************************************************************
ok: [localhost] => {
    "msg": "all default fact"
}

PLAY RECAP *******************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

```bash

$ sudo docker run --rm --name "ubuntu" -d pycontribs/ubuntu:latest sleep 3600
cab6baaab4b9322802f618ad3d10cbfccebb336886f478425520fd94e81aa922

$ sudo docker run --rm --name "centos7" -d pycontribs/centos:7 sleep 3600
cdfa306c478146d0023def9681ac02e5547685a282881d1da3ce31695958522b
```

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

```bash
$ ansible-playbook -i ./inventory/prod.yml site.yml

PLAY [Print os facts] ********************************************************************************

TASK [Gathering Facts] *******************************************************************************
ok: [ubuntu]
ok: [centos7]

TASK [Print OS] **************************************************************************************
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}

TASK [Print fact] ************************************************************************************
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}

PLAY RECAP *******************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

- Значение `some_fact` для `managed host` "ubuntu" `deb`.
- Значение `some_fact` для `managed host` "centos7" `el`.

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: 
* для `deb` — `deb default fact`

```bash
$ cat group_vars/deb/examp.yml 
---
  some_fact: "deb default fact"
```
 
*  для `el` — `el default fact`

```bash
$ cat group_vars/el/examp.yml 
---
  some_fact: "el default fact"
```

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

```bash
$ ansible-playbook -i inventory/prod.yml site.yml 

PLAY [Print os facts] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************************************************************************
ok: [ubuntu]
ok: [centos7]

TASK [Print OS] **********************************************************************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}

TASK [Print fact] ********************************************************************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}

PLAY RECAP ***************************************************************************************************************************************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

```bash
$ ansible-vault encrypt group_vars/deb/examp.yml group_vars/el/examp.yml 
New Vault password: 
Confirm New Vault password: 
Encryption successful

$ cat group_vars/deb/examp.yml 
$ANSIBLE_VAULT;1.1;AES256
32623738656164643834353865353461393132643535303630636332393461363733396533646465
6437643534396462313236656236643965303862313232300a663932373138363537646563303431
32376239386330653636363937623161646133633836316135346337396463633064366263663738
3437646132326637660a646430653132633839663339333634386564646239623135653561663236
34373063373736626334363034653733623766356431343635396139303535666238636134646338
3431613837653261616431396139386162666432623938613432

$ cat group_vars/el/examp.ym
l 
$ANSIBLE_VAULT;1.1;AES256
35366565623665333832373965626239336230383764666163623763343239653964613461633035
3034373565616131353039383935313236393935353763380a623862303666343831663965353630
39353334313538626564393335346330306433373165386433373733373735393863393137376337
3436316264323832310a366539666137366333643665346162303766326137383737353162633962
31633833666432316338396264366663326465303333353933336665636231386632386430313233
6334316237343235656431643934633862343664333330623366
```

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

```bash
$ ansible-playbook -i ./inventory/prod.yml site.yml --ask-vault-password
Vault password: 

PLAY [Print os facts] **********************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************
ok: [ubuntu]
ok: [centos7]

TASK [Print OS] ****************************************************************************************************************
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}

TASK [Print fact] **************************************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}

PLAY RECAP *********************************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

```bash
$ ansible-doc -t connection --l
ist | grep "on control"
ansible.builtin.local          execute on controller 
```

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

```bash
$ cat inventory/prod.yml 
---
  el:
    hosts:
      centos7:
        ansible_connection: docker
  deb:
    hosts:
      ubuntu:
        ansible_connection: docker
  local:
    hosts:
      localhost:
        ansible_connection: local
```

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

```bash
$ cat inventory/prod.yml 
---
  el:
    hosts:
      centos7:
        ansible_connection: docker
  deb:
    hosts:
      ubuntu:
        ansible_connection: docker
  local:
    hosts:
      localhost:
abramov@abramov:~/netology/netology_hw/Система управления конфигурациями/08-ansible-01-base/playbook$ иями/08-playbook -i ./inventory/prod.yml site.yml --ask-vault-password
Vault password: 

PLAY [Print os facts] *************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************
ok: [localhost]
ok: [ubuntu]
ok: [centos7]

TASK [Print OS] *******************************************************************************************************************
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
ok: [localhost] => {
    "msg": "Ubuntu"
}

TASK [Print fact] *****************************************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
ok: [localhost] => {
    "msg": "all default fact"
}

PLAY RECAP ************************************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
