#!/bin/bash

APP=velero
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DIST_DIR=$SCRIPTPATH/../dist

declare -a arr=("1.0.0")

for i in "${arr[@]}"
do
   DOWNLOAD_DIR=$DIST_DIR/$APP/$i
   
   if [ -d "$DOWNLOAD_DIR" ]; then
     echo "$DOWNLOAD_DIR already existis. Skipping..."
     continue
   fi

   mkdir -p $DOWNLOAD_DIR
   cd $DOWNLOAD_DIR
   wget https://github.com/vmware-tanzu/velero/releases/download/v$i/velero-v$i-linux-amd64.tar.gz
   tar -xzvf velero-v$i-linux-amd64.tar.gz
   chmod +rx velero-v$i-linux-amd64/*
done