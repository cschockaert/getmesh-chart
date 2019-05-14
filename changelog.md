# 2.0.0 WIP

upgrading chart to get it work with new getmesh version (with orientdb 3.X)



# 1.2.0
* update to getmesh 0.28.3 (latest getmesh with orientdb 2.x)
* add custom legacy mesh-ui (fix input to textarea for string type edit)
* more vertx thread to prevent deadlock under certains conditions
* update backup and restore jobs
* add orientdb console and various tools (consistency check, elasticsearch reindex, ...)
* add horizontalPodScaling (optional)
* add hard affinity between elasticsearch nodes and getmesh nodes
* add sdd storage to elasticsearch and getmesh nodes
* schedule getmesh master node under sustainable pool

# 1.1.1
* add sleep + file time verification after invoking backup to let time to backup process to be done

# 1.1.0
* add backup cronjob, (only when nfs is available), backup are stored to nfs volume
* add restore pod, start it manually with deployment scaling then kubectl exec -ti into pod and invoke /config/restore.sh
* add backup explorer eg : https://getmesh-backup-explorer.getmesh.mydomain.com/ so we cant remote dl backup easily

# 1.0.1
* update getmesh to 0.28.2
* update default healthcheck probe url to better one 

# 1.0.0

* add anygetmesh svc (routing to master + replicas instances)
* remove uuid in pv / pvc but let an unique name
* BREAKING CHANGE: remove version from getmesh-master-statefulset 
* add default nginx proxy body size to 8m
* prepare backup mode

before updating the chart we must manually delete statefulsets
k delete statefulsets.apps getmesh-master --cascade=false
