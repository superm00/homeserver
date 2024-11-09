terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14" #"3.0.1"
    }
  }
}

resource "proxmox_vm_qemu" "test_server" {
  #count = 1 # just want 1 for now, set to 0 and apply to destroy VM
  name = "test-vm"

  target_node = "matt"
  clone = "ubuntu-2404-cloudinit-template"

  # basic VM settings here. agent refers to guest agent
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size = "10G"
    type = "scsi"
    storage = "local-zfs"
    iothread = 1
  }
  
  # if you want two NICs, just copy this whole network section and duplicate it
  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  # # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
  # lifecycle {
  #   ignore_changes = [
  #     network,
  #   ]
  # }

  ipconfig0 = "ip=dhcp"
  
  # sshkeys set using variables. the variable contains the text of the key.
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}