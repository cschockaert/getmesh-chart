#!/bin/bash
set -euxo pipefail
echo 'using MESH_MASTER_HOST='$MESH_MASTER_HOST
export GETMESH_TOKEN=$(curl -X POST http://$MESH_MASTER_HOST/api/v1/auth/login -H 'accept: application/json' -H 'content-type: application/json' -d '{"username" : "admin","password" : "'"$MESH_INITIAL_ADMIN_PASSWORD"'"} ' | jq .token )
echo 'authenticated with GETMESH_TOKEN='$GETMESH_TOKEN
