 #!/bin/bash
set -euxo pipefail
export MESH_GRAPH_DB_DIRECTORY=${MESH_GRAPH_DB_DIRECTORY:-/graphdb}
export MESH_BINARY_DIR=${MESH_BINARY_DIR:-/uploads}
export BACKUPNFS_FOLDER=${BACKUPNFS_FOLDER:-/backups-nfs}
