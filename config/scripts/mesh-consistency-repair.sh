#!/bin/bash
set -euxo pipefail
source "${BASH_SOURCE%/*}/./mesh-login.sh"
curl -X POST http://$MESH_MASTER_HOST/api/v1/admin/consistency/repair  -H 'Cookie: mesh.token='$GETMESH_TOKEN -v
