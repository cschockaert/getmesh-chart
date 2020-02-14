 #!/bin/bash
set -eo pipefail
export BACKUPNFS_FOLDER=${BACKUPNFS_FOLDER:-/backups-nfs}
export BACKUP_HISTORY_FOLDER=$BACKUPNFS_FOLDER/history
export BACKUP_TMP_FOLDER=$BACKUPNFS_FOLDER/tmp
