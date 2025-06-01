#!/bin/sh

WOLFBEAR_UTILS_DIR=$( pwd )
WOLFBEAR_APPS_DIR=$( dirname "$(pwd)" )/wolfbear-apps

QT_ARM64_DIR=/home/wolfbear/Qt/6.9.0/gcc_arm64
COMPILE_STRATEGY="musl"

if [ "$COMPILE_STRATEGY" = 'musl' ]; then
    include_directories("/usr/include/qt6/QtQml")
fi

echo "Construyendo wolfbear-apps para ARM64. Por favor asegúrate que tu ambiente sea Ubuntu ARM64"
echo "wolfbear-utils dir: '$WOLFBEAR_UTILS_DIR'"
echo "wolfbear-apps dir: '$WOLFBEAR_APPS_DIR'"
echo "qt-arm64 dir: '$QT_ARM64_DIR'"

mkdir -p $WOLFBEAR_UTILS_DIR/target
mkdir -p $WOLFBEAR_APPS_DIR/build

cd $WOLFBEAR_APPS_DIR/build

cmake $WOLFBEAR_APPS_DIR/Launcher -DCMAKE_PREFIX_PATH=$QT_ARM64_DIR
make -j$(nproc)

cd $WOLFBEAR_APPS_DIR/build

rm -f $WOLFBEAR_APPS_DIR/target/LauncherApp.zip
zip -r $WOLFBEAR_UTILS_DIR/target/LauncherApp .
