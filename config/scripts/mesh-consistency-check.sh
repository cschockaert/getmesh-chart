#!/bin/sh
set -euxo pipefail
source ./mesh-login.sh
curl  http://$GETMESH_HOST/api/v1/admin/consistency/check  -H 'Cookie: mesh.token='$GETMESH_TOKEN -v
