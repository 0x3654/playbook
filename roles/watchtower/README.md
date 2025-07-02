VPN Servers Role
=========

Роль для настройки и управления VPN серверами с использованием Docker.

Requirements
------------

- Ansible 2.9+
- Docker и docker-compose на целевых серверах
- Доступ по SSH к целевым серверам
- тестировалось на ubuntu 20.04 - 22.04 и debian 12

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

- `domain_name`: Доменное имя для SSL сертификата
- `city`: Название города для идентификации в конфигурации

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

- `update_repo`: Обновлять ли репозиторий (по умолчанию: true)
- `force_repo_update`: Принудительное обновление репозитория (по умолчанию: true)

Example Playbook
----------------

 - hosts: vpn_servers
  vars:
    domain_name: example.com
    city: Moscow
  roles:
    - vpn_servers

License
-------

MIT

Author Information
------------------

Mikhail
https://github.com/0x3654