# getmesh-chart
A getmesh chart for k8s (WIP / incubator)

This chart is WORKING tested on Google Cloud Platform (v1.12.7-gke.10)


## TO get this working

* helm dependency update
* update values.yaml 
fill up theses variables according to your env :

- global.domain
- persistence.nfs.server pointing to an accessible nfs server (binaries and backup will be there)


## What this chart is doing

using elasticsearch stable chart as requirement

create 1 master node (stateful set getmesh-master, persistent volume for DATA)
create x replicas node (stateful set getmesh-replicas, could be deployment instead of statefull set) theses replicas are ALWAYS starting with empty folder data
so they sync their data with the master node

create a pv + pvc pointing to a NFS server, you have to configure it in values to get this working.

default-distributed-db-config is modified with master node name and other nodes are put to replicas

mesh-ui is only active on master service via ingress:

getmesh.RELEASE-NAME.yourdomain.net


replicas instances are accessible on replica service or with ingress:

getmesh-replicas.RELEASE-NAME.yourdomain.net

