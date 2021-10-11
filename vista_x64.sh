#!/bin/sh
((cores = $(nproc) / 2))
qemu-system-x86_64	-enable-kvm \
			-machine q35 \
			-device intel-iommu \
			-cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
			-smp $(nproc),cores=$cores,threads=2 \
			-m 8192 \
			-vga none \
			-device qxl-vga,vgamem_mb=256 \
			-device virtio-serial-pci \
			-spice port=5900,disable-ticketing=on \
			-device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
			-chardev spicevmc,id=spicechannel0,name=vdagent \
			-monitor stdio \
			-display spice-app \
			-audiodev spice,id=snd0 \
			-device AC97,audiodev=snd0 \
			-nic user,model=virtio-net-pci \
			-drive file=vista.qcow2,index=0,media=disk,if=virtio \
			-drive file=vista.iso,index=1,media=cdrom \
			-drive file=drivers.iso,index=2,media=cdrom \
			-usbdevice keyboard \
			-usbdevice tablet \
			2>/dev/null
