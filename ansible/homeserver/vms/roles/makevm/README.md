Role Name
=========

Creates a VM from template with spesific hardware configuration given in vars. 

Requirements
------------

A Proxmox server setup with ssh access to the server with a user that can configure and create vms. 
Needs a template setup with a cloudinit image. See homeserver.vms.maketemplate.

Role Variables
--------------

```YAML
vm_id: 101
vm_name: test-vm
vm_memory: 2000
vm_cores: 2
template_id: 1000
ssh_key: "<sshkey>"
resize_amount: 10G
static_ip: dhcp
```

Dependencies
------------

Needs a template setup with a cloudinit image. See homeserver.vms.maketemplate.

Example Playbook
----------------

Playbook:
```YAML
- name: Creates a VM out of a existing proxmox template with spesific hardware configruation.
  hosts: proxmoxnodes
  var_file: template_vars.yml
  roles:
    - homeserver.vms.makevm
```
var:
```YAML
vm_id: 101
vm_name: test-vm
vm_memory: 2000
vm_cores: 2
template_id: 1000
ssh_key: "<sshkey>"
resize_amount: 10G
static_ip: 192.168.*.*/24
```
inv:
```YAML
proxmoxnodes:
  hosts: 
    matt:
      ansible_host: <ip>
      ansible_user: <username>
      ansible_password: <password>
```

