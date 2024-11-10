### Information

Sets up the proxmox template using ubuntu cloud init.
You need to have made your cloudimg and palced it within the roles file location. (see the baseimg guide)

### Commands

Use this to import the collection
```
ansible-galaxy collection install -r requirements.yml --force
```

Run the playbook
```
ansible-playbook -i inv.yml ubuntu-template-playbook.yml --ask-vault-pass
```

Edit the varfile
```
EDITOR=nano ansible-vault edit ubuntu-template-var.yml
```