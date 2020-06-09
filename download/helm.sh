#!/bin/bash

APP=helm
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DIST_DIR=$SCRIPTPATH/../dist

declare -a arr=("3.2.1" "2.16.7" "2.13.1")

for i in "${arr[@]}"
do
   DOWNLOAD_DIR=$DIST_DIR/$APP/$i
   
   if [ -d "$DOWNLOAD_DIR" ]; then
     echo "$DOWNLOAD_DIR already existis. Skipping..."
     continue
   fi

   mkdir -p $DOWNLOAD_DIR
   cd $DOWNLOAD_DIR
   wget https://get.helm.sh/helm-v$i-linux-amd64.tar.gz
   tar -xzvf helm-v$i-linux-amd64.tar.gz
   chmod +rx linux-amd64/*
done