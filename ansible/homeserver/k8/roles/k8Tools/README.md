Role Name
=========

Installs some useful cli tools onto the machine that uses the k8 credentials to help manage a k8 cluster. 
Installed tools:
- k9s

See Masterplaybooks/K8 Cluster for an example of this roles use.

Requirements
------------

A k8 cluster with CNI that is set up with access to run kubectl commands (see the homeserver.k8.install role)


Example Playbook
----------------

playbook:
```YAML
- name: Install k8Tools
  hosts: 
    - controllers
  roles:
    - homeserver.k8.k8Tools
```
