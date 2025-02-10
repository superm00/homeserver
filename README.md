## Intro

Within this repo is all the IAC and deployments to set up the whole proxmox homeserver. 
For this inital step it assumes you have a server setup with proxmox installed and using zxf software based raid. 
(Maybe set up a internal vlan on the proxmox deployment)

### baseimg/ 

This folder contains the process needed to install and setup a base ubuntu2204-cloud-init image for the playbooks to use. 

### terraform/

Ths folder contains the terraform attempt of IAC, it creates all the vms needed to set up the server. Sadly proxmox provider is not working well at the moment. will keep an eye on the 3.0 version and return to it later. 

### ansible/

Contains a colection (homeserver) and folders containing playbooks that can be used to build different items using those roles. 

#### /homeserver/

The collection of roles of standard processes also this can be used by AWX easily in the future.

##### /k8



##### /vms

- maketemplate
- makevm

#### /MasterPlaybooks/

Contains the playbooks that run the roles and vars together to build the current in use deployment. 

#### reverse proxy

Using nginix server
Using made ansible roles (vm role etc).

#### vpn

Using Wireshark