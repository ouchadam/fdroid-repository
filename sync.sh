#! /bin/bash

# TAG=$1

TAG="07/11/2022-V1"
NORMALISED_TAG=$(echo $TAG | tr '/' '.')
UPSTREAM_FILENAME=$(echo "foss-signed-$TAG.apk" | tr '/' '.')
URL_ENCODED_TAG=$(echo $TAG | sed -e "s/\//%2F/g")

wget "https://github.com/ouchadam/small-talk/releases/download/$URL_ENCODED_TAG/$UPSTREAM_FILENAME"
mv $UPSTREAM_FILENAME "repo/$NORMALISED_TAG.apk"

fdroid update