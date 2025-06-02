#!/bin/sh

WOLFBEAR_UTILS_DIR=$( pwd )
WOLFBEAR_APPS_DIR=$( dirname "$(pwd)" )/wolfbear-apps
WOLFBEAR_SYSAPPS_DIR=$( dirname "$(pwd)" )/wolfbear-os/overlay/sys-apps

QT_ARM64_DIR="/usr/lib/qt6"

export QML2_IMPORT_PATH=/usr/lib/qt6/qml

echo "Construyendo wolfbear-apps para ARM64. Por favor asegúrate que tu ambiente sea Ubuntu ARM64"
echo "wolfbear-utils dir: '$WOLFBEAR_UTILS_DIR'"
echo "wolfbear-apps dir: '$WOLFBEAR_APPS_DIR'"
echo "qt-arm64 dir: '$QT_ARM64_DIR'"
echo "sys-apps dir dir: '$WOLFBEAR_SYSAPPS_DIR'"
sleep 2

mkdir -p $WOLFBEAR_UTILS_DIR/target
mkdir -p $WOLFBEAR_APPS_DIR/build

echo "Eliminando compilación anterior"
sleep 1

rm -rf $WOLFBEAR_APPS_DIR/build
mkdir -p rm -rf $WOLFBEAR_APPS_DIR/build

echo "Obteniendo los ultimos cambios"
sleep 1

cd $WOLFBEAR_APPS_DIR
git pull origin main

echo "Abriendo directorio de compilación $WOLFBEAR_APPS_DIR/build"
sleep 2
cd $WOLFBEAR_APPS_DIR/build

# Habilitar si no encuentra el compilado por la version QtQml
# doas mkdir -p /usr/include/qt6/QtQml/6.8.2
# doas ln -s /usr/include/qt6/QtQml /usr/include/qt6/QtQml/6.8.2/QtQml
# doas mkdir -p /usr/include/qt6/QtCore/6.8.2
# doas ln -s /usr/include/qt6/QtCore /usr/include/qt6/QtCore/6.8.2/QtCore

echo "Compilando Launcher en $WOLFBEAR_APPS_DIR/Launcher"
sleep 2

cmake $WOLFBEAR_APPS_DIR/Launcher -DCMAKE_PREFIX_PATH=$QT_ARM64_DIR
make -j$(nproc)

echo "Eliminando antigua aplicación de Launcher"
sleep 2

rm -rf $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp.d
mkdir -p $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp.d

rm -f $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp.zip

echo "Accediendo al directorio $WOLFBEAR_APPS_DIR/build"
sleep 2
cd $WOLFBEAR_APPS_DIR/build

echo "Comprimiendo el directorio $( pwd ) hacia $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp"
sleep 2
zip -r $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp .

echo "Desempaquetando en sys-apps"
sleep 2

unzip $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp.zip -d $WOLFBEAR_SYSAPPS_DIR/apps/wolfbear-apps/LauncherApp.d