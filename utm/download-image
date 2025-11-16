#!/bin/bash

WOLFBEAR_ARM64_HOST=192.168.64.8
WOLFBEAR_INTEL_AMD_x86_64_HOST=192.168.2.2

PATH_TO_WOLFBEAR_OS_TARGET="~/wolfbear-os/target"

echo "Ejecutando QEMU como archivos de Kernel"

echo "Eliminando archivos anteriores"
rm -f ./output/WolfbearOS_ARM64.img

echo "Descargando nuevos archivos"

mkdir -p ./output
sshpass -p "Naru112" scp ${WOLFBEAR_ARM64_HOST}:${PATH_TO_WOLFBEAR_OS_TARGET}/generated.img ./target/WolfbearOS_ARM64.img
# sshpass -p "Naru112" scp ${WOLFBEAR_INTEL_AMD_x86_64_HOST}:${PATH_TO_WOLFBEAR_OS_TARGET}/generated.img ./target/WolfbearOS_IntelAMD_x86-64.img

echo "Descarga exitosa"
