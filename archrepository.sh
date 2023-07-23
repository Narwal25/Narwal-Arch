#!/bin/bash
set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

REMOTE_PATH=s3://narwal-arch/os/x86_64
LOCAL_PATH=$PWD/repo
REPO_NAME=narwal-arch

PACKAGES=${@:-pkg/*}

mkdir -p "$LOCAL_PATH"

for package in $PACKAGES; do
    cd "$package"
    rm -f *.pkg.tar.xz
    makepkg -si
    cd -
done

s3cmd sync "$REMOTE_PATH/$REPO_NAME".{db,files}.tar.xz "$LOCAL_PATH/"
ln -sf "$REPO_NAME.db.tar.xz" "$LOCAL_PATH/$REPO_NAME.db"
ln -sf "$REPO_NAME.files.tar.xz" "$LOCAL_PATH/$REPO_NAME.files"


echo ${PACKAGES[@]}

repo-add "$LOCAL_PATH/$REPO_NAME.db.tar.xz" "${PACKAGES[@]}/"*.pkg.tar.zst


s3cmd sync --follow-symlinks --acl-public \
    "${PACKAGES[@]}/"*.pkg.tar.zst \
    "$LOCAL_PATH/$REPO_NAME".{db,files}{,.tar.xz} \
    "$REMOTE_PATH/"
