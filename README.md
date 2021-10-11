# Vista-KVM

### Instruction

The first time you coming, you have to download a 64-BIT Windows Vista CD IMAGE.

And then create a new virtual disk:

``` shell
$ qemu-img create -f qcow2 vista.qcow2 128000000000 # this size <128G, change the size as your needed here.
```

The `drivers.iso` is for config in script, but without 3D acceleration support.

Make sure you have a kernel with KVM support, to check it:

``` shell
$ lsmod | grep kvm
```

If you have a AMD CPU, open script and change `intel-iommu` to other.

### FAQ

Q: Is it provide an install media for Windows Vista?

A: No, you should get it in your way. Once you have done, move it to here with a name `vista.iso`.

Q: Could it posible to use `AERO` theme?

A: No, no present. This guest come with full drivers but **without** 3D acceleration support.

### Sponsor

If you like this project, give a **star** to support me. 
