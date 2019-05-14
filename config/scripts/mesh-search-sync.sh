#!/bin/sh
set -euxo pipefail
source ./mesh-login.sh
curl -X POST http://$GETMESH_HOST/api/v1/search/sync  -H 'Cookie: mesh.token='$GETMESH_TOKEN -v
