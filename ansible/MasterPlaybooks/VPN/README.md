### Information

This playbook inits a vpn (using tag vm_setup and wireguard_setup). 
Then create a bloc for each user and a var for each user.
See vpn-var-example.yml for an example of a var.

### Commands

Use this to import the collection
```
ansible-galaxy collection install -r requirements.yml --force
```

Run the playbook:
to just make the vm:
```
ansible-playbook -i inv.yml vpn-playbook.yml --ask-vault-pass -tags "vm_setup" 
```
Make the vm:
```
ansible-playbook -i inv.yml vpn-playbook.yml --ask-vault-pass -tags "wireguard_setup" 
```
Make users:
```
ansible-playbook -i inv.yml vpn-playbook.yml --ask-vault-pass -tags "create_users" 
```

Edit the varfile
```
EDITOR=nano ansible-vault edit vpn-var-example.yml
```
