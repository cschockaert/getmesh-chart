#!/bin/bash
set -euxo pipefail
source "${BASH_SOURCE%/*}/./mesh-login.sh"
curl http://$GETMESH_HOST/api/v1/search/status  -H 'Cookie: mesh.token='$GETMESH_TOKEN -v
