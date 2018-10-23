# getmesh-chart
A getmesh chart for k8s (WIP / incubator)

This chart is WORKING tested on Google Cloud Platform (v1.10.6-gke.2)

## TODO 

* better management of keystore, actually keystore is located in config folder (in order to share it with other replicas instances)
you have to manually create it, or let getmesh create it but share keystore with other instances (with nfs volume like uploads for eg)

* test MASTER mode only, actually this chart will create 1 master node and 2 replicas nodes, it's because there is some conflict when using
multiples master at the same time via mesh-ui and an unique service.

* improve backup system (perhaps with the use of a dedicated node)

* add more doc

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

