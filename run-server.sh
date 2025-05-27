#!/bin/sh

set -e  # Exit immediately on error

cd /opt/foundryvtt || exit
echo "Copying zip file..."
find /host -type f -name '[f,F]oundry[vtt,VTT]*.zip' -exec cp '{}' . ';'

echo "Unzipping..."
unzip -o ./*.zip -d unpacked && rm ./*.zip

echo "Cleaning target app folder..."
rm -rf resources/app/*

echo "Moving to mapped directory..."
mv unpacked/* resources/app/

echo "Starting node..."
cd resources/app
exec node main.mjs --dataPath=/data/foundryvtt