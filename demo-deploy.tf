resource "proxmox_vm_qemu" "deploy-testing" {
    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "vostro"
    desc = "Cloudinit Ubuntu"
    count = 4
    onboot = true

    # The template name to clone this vm from
    clone = "ubuntu-cloud"

    # Activate QEMU agent for this VM
    agent = 0

    os_type = "cloud-init"
    cores = 2
    sockets = 2
    numa = true
    vcpus = 0
    cpu = "host"
    memory = 2048
    name = "demo-sv-0${count.index + 1}"

    cloudinit_cdrom_storage = "hard-disk-storage"
    scsihw   = "virtio-scsi-single" 
    bootdisk = "scsi0"

    disks {
        scsi {
            scsi0 {
                disk {
                  storage = "hard-disk-storage"
                  size = 20
                }
            }
        }
    }

    # Setup the ip address using cloud-init.
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=158.108.38.8${count.index + 6}/24,gw=158.108.38.193"
    ciuser = "wen"
    nameserver = "158.108.0.2"
}
