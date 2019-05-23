#!/bin/bash
set -euxo pipefail
echo 'using GETMESH_HOST='$GETMESH_HOST
export GETMESH_TOKEN=$(curl -X POST http://$GETMESH_HOST/api/v1/auth/login -H 'accept: application/json' -H 'content-type: application/json' -d '{"username" : "admin","password" : "admin"} ' | jq .token )
echo 'authenticated with GETMESH_TOKEN='$GETMESH_TOKEN
