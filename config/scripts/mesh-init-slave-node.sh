#!/bin/bash
set -euxo pipefail
source mesh-commons-vars.sh

export MESH_BINARY_DIR=${MESH_BINARY_DIR:-/uploads}
chown 1000:1000 $MESH_BINARY_DIR

until nslookup {{ template "getmesh.fullname" . }}-hazelcast.{{ .Release.Namespace }}.svc.cluster.local
do echo waiting for hazelcast $(date)
sleep 2
done
echo 'init done'
