### Information

This master playbook creates a basic k8 cluster with cilium and longhorn installed in it. 

It will create a ingress that allows you to access the longhorn web interface. From there do the following:

- For each worker remove the usage of the root drive for longhorn.
- Manaully mount drives using proxmox to the vms and then run the final step of the playbook.
- Allocate that drive path /dev/sdb (Normally)

### Commands

Use this to import the collection
```
ansible-galaxy collection install -r requirements.yml --force
```

Run the playbook
```
ansible-playbook -i inv.yml K8-playbook.yml --ask-vault-pass
```

Edit the varfile
```
EDITOR=nano ansible-vault edit example-var.yml
```
