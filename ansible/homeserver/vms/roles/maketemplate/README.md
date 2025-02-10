Role Name
=========

Creates a template on a proxmox server using a cloud init image. 

Requirements
------------

You need the base img. 

See [Link](https://austinsnerdythings.com/2021/08/30/how-to-create-a-proxmox-ubuntu-cloud-init-image/) for where I got this guide from. 

But to re-iterate the steps. 

Download onto local machine the img at the files section.
```
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
```

Install libguestfs and install the qemu-guest-agent.
```
apt update -y && apt install libguestfs-tools -y
virt-customize -a noble-server-cloudimg-amd64.img --install qemu-guest-agent
```

Role Variables
--------------

```YAML
img_file: noble-server-cloudimg-amd64.img
template_id: 1000
template_name: ubuntu-2404-cloudinit-template
```

Dependencies
------------

No dependant playbooks/roles,
Needs ssh access to the proxmox server.
A user that can create templates and configure vms. 
Needs you to pull down the server img and follow the steps above before running. 

Example Playbook
----------------

Playbook:
```YAML
- name: turns a cloudinit.img into a proxmox template. 
  hosts: proxmoxnodes
  var_file: template_vars.yml
  roles:
    - homeserver.vms.maketemplate
```
var:
```YAML
img_file: noble-server-cloudimg-amd64.img
template_id: 1000
template_name: ubuntu-2404-cloudinit-template
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
