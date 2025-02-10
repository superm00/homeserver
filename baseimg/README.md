### Base Image Creation Guide

See [Link](https://austinsnerdythings.com/2021/08/30/how-to-create-a-proxmox-ubuntu-cloud-init-image/) for where I got this guide from. 

But to re-iterate the steps. 

Download onto local machine the img
```
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
```

Install libguestfs and install the qemu-guest-agent.
```
apt update -y && apt install libguestfs-tools -y
virt-customize -a noble-server-cloudimg-amd64.img --install qemu-guest-agent
```
Set up ssh key for ansible. 
```
ssh-keygen -t rsa -b 4096
```

# not quite working yet. skip this and continue
Setting up user and ssh key so ansible can log in after creation and set up an applicaiton and user.
```
virt-customize -a noble-server-cloudimg-amd64.img \
  --root-password password:rootpass \
  --add-user ansible:ansible \
  --mkdir /home/ansible/.ssh \
  --copy-in ./ansible.pub:/home/ansible/.ssh/authorized_keys \
  --run-command 'chmod 700 /home/ansible/.ssh; chmod 600 /home/ansible/.ssh/authorized_keys; chown -R ansible:ansible /home/ansible/.ssh'
```
# not quite working yet. skip this and continue
```
sudo virt-customize -a noble-server-cloudimg-amd64.img --run-command 'useradd ansible'
sudo virt-customize -a noble-server-cloudimg-amd64.img --run-command 'mkdir -p /home/ansible/.ssh/authorized_keys'
sudo virt-customize -a noble-server-cloudimg-amd64.img --copy-in ./ansible.pub:/home/ansible/.ssh/authorized_keys
sudo virt-customize -a noble-server-cloudimg-amd64.img --run-command 'chown -R ansible:ansible /home/ansible'
```

Now upload file using proxmox ui.
Do the following steps on the proxmox machine.
within /var/lib/vz/template/iso is the .img file and run the following commands from that directory.

```
qm create 9000 --name "ubuntu-2404-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9000 noble-server-cloudimg-amd64.img local-zfs
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-zfs:vm-9000-disk-0
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --ide2 local-zfs:cloudinit
qm set 9000 --serial0 socket --vga serial0
qm set 9000 --agent enabled=1
qm set 9000 --ipconfig0 ip=dhcp
qm template 9000
```

#### Testing

Now to test template you can use
```
qm clone 9000 999 --name test-clone-cloud-init

qm start 999
```
Try to ssh in with user ubuntu and the sshkey
```
ssh -i keyfile ubuntu@IP
```