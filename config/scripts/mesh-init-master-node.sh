#!/bin/bash
set -euxo pipefail
source mesh-commons-vars.sh

chown 1000:1000 $MESH_BINARY_DIR
chown 1000:1000 $BACKUPNFS_FOLDER && mkdir -p $BACKUPNFS_FOLDER/history && chown -R 1000:1000 $BACKUPNFS_FOLDER/history

echo 'rm distributed-config to force cluster reinitialization (no impact on exiting data)'
rm -f $MESH_GRAPH_DB_DIRECTORY/storage/distributed-config.json
#rm -f $GRAPHDB_FOLDER/storage/distributed-sync.json

if [ "$REPAIR_DATABASE_BEFORE_STARTUP" = "true" ]; then
bash mesh-repair-orientdb.sh
chown -R 1000:1000 /graphdb
fi

echo 'init done'
