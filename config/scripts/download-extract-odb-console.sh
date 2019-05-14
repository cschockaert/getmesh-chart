#!/bin/sh

set -euxo pipefail
curl -o orientdb.zip https://s3.us-east-2.amazonaws.com/orientdb3/releases/3.0.14/orientdb-3.0.14.zip && unzip orientdb.zip
apk add openjdk8-jre
echo "orientdb-3.0.14/bin/console.sh then --> connect plocal:/root/tmp/odb-backup/ admin admin"
