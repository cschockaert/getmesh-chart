# docker image with mesh server used to backup and restore


# revision of db can be found here :
# https://maven.gentics.com/maven2/com/gentics/mesh/mesh-orientdb/0.40.3/mesh-orientdb-0.40.3-revision.txt


export GETMESH_VERSION=0.40.3 && export ODB_VERSION=3.0.23
docker build --build-arg GETMESH_VERSION=${GETMESH_VERSION} --build-arg ODB_VERSION=${ODB_VERSION} -t cschockaert/mesh-tools:${GETMESH_VERSION} . 
docker push cschockaert/mesh-tools:${GETMESH_VERSION}
