#!/bin/bash
set -euxo pipefail
source "${BASH_SOURCE%/*}/./mesh-login.sh"

echo "larkcontent is 3055b7c85aad46159cfc90311f8f9993"

if [[ -z $1 ]]; then echo "first arg should be project uuid to purge"; exit 1; fi

curl -X POST http://$GETMESH_HOST/api/v2/projects/$1/maintenance/purge  -H 'Cookie: mesh.token='$GETMESH_TOKEN -v
