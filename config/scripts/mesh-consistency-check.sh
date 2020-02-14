#!/bin/bash
set -euxo pipefail
source "${BASH_SOURCE%/*}/./mesh-login.sh"
curl  http://$MESH_MASTER_HOST/api/v1/admin/consistency/check  -H 'Cookie: mesh.token='$GETMESH_TOKEN -v
