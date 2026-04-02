# VM with GPU passthrough


## GPUs
IOMMU Group 28:
	2d:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208B [GeForce GT 710] [10de:128b] (rev a1)
	2d:00.1 Audio device [0403]: NVIDIA Corporation GK208 HDMI/DP Audio Controller [10de:0e0f] (rev a1)
IOMMU Group 29:
	2e:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP104 [GeForce GTX 1080] [10de:1b80] (rev a1)
	2e:00.1 Audio device [0403]: NVIDIA Corporation GP104 High Definition Audio Controller [10de:10f0] (rev a1)


### Isolating
10de:1b80
10de:10f0

```
# Add to /etc/default/grub
vfio_pci.ids=10de:1b80,10de:10f0

# Check
fuser -v /dev/nvidia1
```


## Libvrt
```
virsh pool-define-as main dir - - - - /home/zoee/.local/libvirt/images
```

## TPM
```
sudo pacman -Sy swtpm
```

## Looking glass
Shared memory location: /dev/shm/looking-glass

```
looking-glass-client -f /dev/shm/looking-glass win:size=1920x1080
looking-glass-client -f /dev/shm/looking-glass -F

chmod +x ~/looking-glass-suspend.sh

sudo systemctl enable looking-glass-suspend.service
```


### Original video
```
<video>
  <model type="qxl" ram="65536" vram="65536" vgamem="16384" heads="1" primary="yes"/>
  <alias name="video0"/>
  <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x0"/>
</video>
```

### Shared directory
```
    <filesystem type='mount' accessmode='passthrough'>
      <driver type='virtiofs' queue='1024'/>
      <source dir='/home/zoee/Developer/handmade-zig'/>
      <target dir='handmade'/>
    </filesystem>
```

### Bridged network
```
ip link show

nmcli connection add type bridge ifname br0 con-name br0
nmcli connection add type bridge-slave ifname enp39s0 master br0 con-name br0-slave
nmcli connection up br0
nmcli connection up br0-slave

sudo systemctl restart systemd-networkd

ip addr show br0
```

### Original network
```
<interface type="network">
  <mac address="52:54:00:9e:b9:a4"/>
  <source network="default"/>
  <model type="e1000e"/>
  <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
</interface>
```

### SSH
```
sshfs zoee@192.168.1.12:/C:/Users/zoee/Developer/handmade-zig ~/mnt/vm-code
nvim ~/mnt/vm-code/file.py
```

## Todo
* Figure out how to store VM state between suspends.
  * Seems like it isn't possible with passthrough GPU.
  * Remove the suspend/resume scripts.
* Force caps to be off on windows login?
* Install ripgrep.
* Fix button repeat on windows.
* Include VM configuration in dotfiles?

## How to share files
* sshfs: works, but issues with start/stop and git repo.
* virtio-fs: seems like the best approach, should integrate better with VM start/stop hopefully.
  * zig --watch doesn't work, but it's fine since we can run it on the host.
  * nvim netrw doesn't work, launch everything from debugger like Casey.


## Manual start/stop
Since we don't seem to get suspend/resume for the VM we should make scripts for starting/stopping the VM instead.

### Windows boot
* Start explorer in project directory.
* Start wezterm in project directory.
* Force caps-lock to be off.

### Start
* Launch VM.
* Mount SSH to file system.
* Launch looking glass.
* Go to ~/mnt/vm-code.

### Stop
* Disconnect looking glass.
* Unmount SSH from file system.
* Shutdown VM.


## Reference
* https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF
* https://www.ibm.com/docs/en/linux-on-systems?topic=setup-pci

