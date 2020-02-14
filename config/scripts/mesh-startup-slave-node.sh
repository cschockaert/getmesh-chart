 #!/bin/bash
set -euxo pipefail
source mesh-commons-vars.sh

#case "$HOSTNAME" in
#    *replicas*) echo 'rm database as we are a slave node' && rm -rf $MESH_GRAPH_DB_DIRECTORY/** ;;
#esac

export MESH_NODE_NAME=$HOSTNAME

exec java $JAVA_START_OPTIONS -Djna.tmpdir=/tmp/.jna -Duser.dir=/mesh -jar mesh.jar
