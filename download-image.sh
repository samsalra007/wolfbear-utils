#!/bin/bash

WOLFBEAR_DEBIAN_DEV_HOST=192.168.65.2
PATH_TO_WOLFBEAR_OS_TARGET="~/wolfbear-os/target"

echo "Ejecutando QEMU como archivos de Kernel"

echo "Eliminando archivos anteriores"
rm -f ./target/generated.img

echo "Descargando nuevos archivos"

mkdir -p ./target
sshpass -p "Naru112" scp ${WOLFBEAR_DEBIAN_DEV_HOST}:${PATH_TO_WOLFBEAR_OS_TARGET}/generated.img ./target

echo "Descarga exitosa"

#echo "Ejecutando QEMU"
# qemu-system-aarch64 \
#  -machine virt \
#  -cpu cortex-a72 \
#  -m 3196 \
#  -smp cpus=3 \
#  -bios EFI/QEMU_EFI.fd \
#  -drive file=target/generated.img,if=virtio,format=raw \
#  -drive file=target/disk.qcow2,if=virtio,format=qcow2,cache=writeback \
#  -netdev user,id=net0 \
#  -device virtio-net-device,netdev=net0 \
#  -serial stdio
