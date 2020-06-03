tenantcloud.ansible_role_metricbeat
=========

Ansible role for install and setup metricbeat. This role include in default terraform scenario for auto-deploy new server.

Requirements
------------

ELK Stack, Elastalert, ReadOnlyRest

Role Variables
--------------

ea_dir: elastalert
Name elastalert directory

elk_url: 10.0.0.1
ELK server IP address

elk_username: ChangeMe
Username from readonlyrest for connect to elasticsearch

elk_password: ChangeMe
Password from readonlyrest for connect to elasticsearch

Dependencies
------------

Example Playbook
----------------

```yaml
  - hosts: localhost
    vars:
      ea_dir: elastalert
      elk_url: 10.0.0.1
      elk_username: ChangeMe
      elk_password: ChangeMe
    become: yes
    roles:
      - tenantcloud.ansible_role_metricbeat
```

License
-------

BSD

Author Information
------------------

TenantCloud DevOps Team
