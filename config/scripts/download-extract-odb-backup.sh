#!/bin/sh
set -euxo pipefail
mkdir -p /root/tmp && cd /root/tmp
if [ -z $1 ]; then echo "first arg should be an url to a orientdb backup zip file"; exit 1; fi
#curl https://getmesh-backup-explorer.getmesh-staging.gcp.dvl.auchan.net/nfs-fileserver/lark-itgf-content-getmesh-backups/history/2019-02-05_03-00-26/backup_05-02-2019_03-00-27-026.zip -o odb-backup.zip
curl $1 -o odb-backup.zip
rm -rf odb-backup/ && mkdir odb-backup/ && unzip odb-backup.zip -d ./odb-backup && chown -R 1000:1000 ./odb-backup