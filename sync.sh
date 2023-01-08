#! /bin/bash

TAG=$(curl https://api.github.com/repos/ouchadam/small-talk/releases/latest | jq ".tag_name")
NORMALISED_TAG=$(echo $TAG | tr '/' '.')
UPSTREAM_FILENAME=$(echo "foss-signed-$TAG.apk" | tr '/' '.')
URL_ENCODED_TAG=$(echo $TAG | sed -e "s/\//%2F/g")

wget "https://github.com/ouchadam/small-talk/releases/latest/download/$UPSTREAM_FILENAME"
mkdir repo
mv $UPSTREAM_FILENAME "repo/small-talk-$NORMALISED_TAG.apk"

fdroid update

git commit -am "Syncing repo"
git push