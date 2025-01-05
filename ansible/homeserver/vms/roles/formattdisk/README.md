Role Name
=========

This role creates a ext4 filesystem on a disk when given a path to a disk. 

Requirements
------------

Create and mount a drive to the VM, then confirm the path it will be located at. 

Role Variables
--------------
```YAML
new_disk: /dev/sdX
```

Example Playbook
----------------

playbook:
```YAML
- name: Formatt disk
  hosts: 
    - workers
  roles:
    - homeserver.vms.formattdisk
```

inv:
```YAML
workers:
  hosts: 
    worker1:
      new_disk: /dev/sdb
```