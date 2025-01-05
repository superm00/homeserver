Role Name
=========

Installs the basic k8 cluster and its dependants (Including the container runtime containerd) and does the nesserary configurations. 

Requirements
------------

A controller and 2 workers (suggested minium) see K8 requirements for machine specs but 2 cores 2GB of ram and 25GB of HD space for the bare minium installation.
If using proxmox you can use the homeserver.vms.makevm to create these machines.
See Masterplaybooks/K8 Cluster for an example of this roles use.

Example Playbook
----------------

Role Variables
--------------
```YAML
ingress_ip: 192.168.86.251
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
      ingress_ip: 192.168.86.251
```