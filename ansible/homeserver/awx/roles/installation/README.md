Role Name
=========

Installs AWX using helm

Requirements
------------

A k8 cluster with CNI that is set up with access to run kubectl commands and helm charts (see the homeserver.k8.install and homeserver.k8.k8Tools role)

Role Variables
--------------

```YAML
ingress_ip: 192.168.86.xx
awx_admin_password: password
```

Example Playbook
----------------

inv:
```YAML
ingress_ip: 192.168.86.xx
awx_admin_password: password
```

playbook:
```YAML
---
- name: Creates a VM out of a existing proxmox template with a spesific hardware configruation.
  hosts: controllers
  roles:
    - homeserver.awx.installation
```
