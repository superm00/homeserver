Role Name
=========

Installs longhorn using the longhorn CLI on a K8 cluster.
Its suggested after running this role you configure addinonal drives that longhorn will use to store the data. (see homeserver.vms.formattdisk)
See Masterplaybooks/K8 Cluster for an example of this roles use.

Requirements
------------

A k8 cluster with CNI that is set up with access to run kubectl commands (see the homeserver.k8.install role)

Example Playbook
----------------

Role Variables
--------------
```YAML
ingress_ip: 192.168.86.xx
```

Example Playbook
----------------

playbook:
```YAML
- name: Install Longhorn
  hosts: 
    - controllers
  roles:
    - homeserver.k8.longhorn
```

inv:
```YAML
controllers:
  hosts: 
    controller:
      ingress_ip: 192.168.86.xx
```