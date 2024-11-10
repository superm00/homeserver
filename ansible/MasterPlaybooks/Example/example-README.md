### Information


### Commands

Use this to import the collection
```
ansible-galaxy collection install -r requirements.yml --force
```

Run the playbook
```
ansible-playbook -i inv.yml example-playbook.yml --ask-vault-pass
```

Edit the varfile
```
EDITOR=nano ansible-vault edit example-var.yml
```