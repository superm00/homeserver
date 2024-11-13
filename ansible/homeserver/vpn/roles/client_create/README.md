client_create
=========

This role sets up wireguard vpn user it creates a signle user from the given var file, it also restarts the vpn during this so adding users can cause a minor interuption.

Requirements
------------

A vm that has ssh access.

Role Variables
--------------

```YAML
name: 
client_ip: 
return_dir: ~/homeserver/vpn_configs/
```

Dependencies
------------

Needs a homeserver.vpn.init to have been setup. 

Example Playbook
----------------

Master playbook
```YAML
- name: Creates a VM out of a existing proxmox template with a spesific hardware configruation.
  hosts: proxmoxnodes
  tags:
    - vm_setup
  vars_files: 
    - vpn-var.yml
  roles:
    - homeserver.vms.makevm

- name: Creates a wireguard vpn with no clients
  hosts: vpn
  tags:
  - wireguard_setup
  roles:
    - homeserver.vpn.init

- name: Creates wireguard vpn client -- Matt
  hosts: vpn
  tags:
  - create_users
  vars_files: 
    - vpn-clients/vpn-var-matt.yml
  roles:
    - homeserver.vpn.client_create

- name: Creates wireguard vpn client -- Jonathan
  hosts: vpn
  tags:
  - create_users
  vars_files: 
    - vpn-clients/vpn-var-jonathan.yml
  roles:
    - homeserver.vpn.client_create
```

inv.yml
```YAML
proxmoxnodes:
  hosts: 
    matt:
      ansible_host: 
      ansible_user: 
      ansible_password: 

vpns:
  hosts: 
    vpn:
      ansible_host: 
      ansible_user: 
      ansible_ssh_private_key_file: 
      server_ip: 192.168.211.1/24
      server_port: 51820
```

var.yml
```YAML
name: 
client_ip: 
return_dir: ~/homeserver/vpn_configs/
```
