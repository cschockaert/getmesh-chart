ARG GETMESH_VERSION
FROM gentics/mesh:${GETMESH_VERSION}
LABEL maintainer="cschockaert@auchan.fr"

USER root
WORKDIR /root

RUN apk add --no-cache curl tar bash procps jq nodejs unzip npm
RUN npm install mesh-cli -g

ARG ODB_VERSION=3.0.23
ENV ODB ${ODB_VERSION}

USER mesh
WORKDIR /mesh

#RUN curl -o orientdb.zip https://s3.us-east-2.amazonaws.com/orientdb3/releases/${ODB_VERSION}/orientdb-community-importers-${ODB_VERSION}.zip && unzip orientdb.zip && rm orientdb.zip
RUN curl -o orientdb.zip https://s3.us-east-2.amazonaws.com/orientdb3/releases/${ODB}/orientdb-${ODB}.zip && unzip orientdb.zip && rm orientdb.zip
ENV PATH="${PATH}:/mesh/orientdb-${ODB}/bin:/mesh/orientdb-community-importers-${ODB}/bin"

CMD ["cat"]
