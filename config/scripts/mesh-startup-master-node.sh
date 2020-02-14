#!/bin/bash
set -euxo pipefail
source mesh-commons-vars.sh

export MESH_NODE_NAME=$HOSTNAME

# if a backup exist restore it before starting mesh server
ORIENTDB_RESTORE_FILE=$BACKUPNFS_FOLDER/orientdb-restore/orientdb-restore.zip

if [ -f $ORIENTDB_RESTORE_FILE ]; then
  echo "File $ORIENTDB_RESTORE_FILE exists. Will process restore before starting master node and start the node in STANDALONE (no cluster), master && replicas should be restarted after that in order to join the new cluster"
  export MESH_CLUSTER_NAME=$MESH_CLUSTER_NAME-$(date | md5sum | head -c 5)
  echo "move old storage (/graphdb/storage) to folder $BACKUPNFS_FOLDER/orientdb-restore/old-storage-"$MESH_CLUSTER_NAME
  mv $MESH_GRAPH_DB_DIRECTORY/storage $BACKUPNFS_FOLDER/orientdb-restore/old-$MESH_CLUSTER_NAME

  echo "extract backup to $MESH_GRAPH_DB_DIRECTORY/storage then mark it as consumed and rm distributed configs"
  mkdir -p $MESH_GRAPH_DB_DIRECTORY/storage && unzip $ORIENTDB_RESTORE_FILE -d $MESH_GRAPH_DB_DIRECTORY/storage/
  rm -f $MESH_GRAPH_DB_DIRECTORY/storage/distributed-*.json
  mv $ORIENTDB_RESTORE_FILE $ORIENTDB_RESTORE_FILE-$MESH_CLUSTER_NAME.restored

  export MESH_CLUSTER_ENABLED=false
fi

echo "using MESH_CLUSTER_NAME="$MESH_CLUSTER_NAME
if [ -d $MESH_GRAPH_DB_DIRECTORY/storage/ ]; then
  echo "starting getmesh (cluster already exist)"
  exec java $JAVA_START_OPTIONS -Djna.tmpdir=/tmp/.jna -Duser.dir=/mesh -jar mesh.jar -resetAdminPassword $MESH_INITIAL_ADMIN_PASSWORD
else
  echo "first start detected running getmesh with init cluster flag (-initCluster)"
  exec java $JAVA_START_OPTIONS -Djna.tmpdir=/tmp/.jna -Duser.dir=/mesh -jar mesh.jar -resetAdminPassword $MESH_INITIAL_ADMIN_PASSWORD -initCluster
fi
