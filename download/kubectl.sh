#!/bin/bash

APP=kubectl
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
DIST_DIR=$SCRIPTPATH/../dist

declare -a arr=("1.18.0" "1.17.0")

for i in "${arr[@]}"
do
   DOWNLOAD_DIR=$DIST_DIR/$APP/$i

   if [ -d "$DOWNLOAD_DIR" ]; then
     echo "$DOWNLOAD_DIR already existis. Skipping..."
     continue
   fi

   mkdir -p $DOWNLOAD_DIR
   cd $DOWNLOAD_DIR
   curl -LO https://storage.googleapis.com/kubernetes-release/release/v$i/bin/linux/amd64/kubectl
   chmod +rx $DOWNLOAD_DIR/kubectl
done