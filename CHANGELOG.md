# 3.1.1
* refacto mesh script and config file
* only override hazelcast.xml, logback.xml, default-distributed-db-config.json and keystore.jceks
* bump mesh to 1.4.0

# 3.0.0
* update healthchecks

# 3.0.2
* add admin password management

# 3.0.0
* update mesh to 1.3.2

# 2.3.2
* add keycloack auth variables

# 2.3.1
* update mesh to 1.0.2

# 2.3.0
* update mesh to 1.0.1

# 2.2.2
* update mesh to 0.41.0

# 2.2.1
* update mesh to 0.40.3

# 2.2.0
* update mesh to 0.40.2
* update elasticsearch to 6.8.2

# 2.1.0
* add keycloack
* update ui : better textarea scroll and filter option in create node

# 2.0.0
* label refactoring install instructions:

k delete statefulsets.apps RELEASE-NAME-master RELEASE-NAME-replicas --cascade=false
k delete deployments RELEASE-NAME-ui RELEASE-NAME-restore RELEASE-NAME-backup-explorer
k delete cronjobs.batch RELEASE-NAME-backup-cronjob

* add metrics : getmesh and elasticsearch (based on justwatch/elasticsearch_exporter:1.0.2)
* add 2 grafana dashboard: getmesh and getmesh elasticsearch
* update to getmesh 0.33.1 (getmesh with orientdb 3.0.19)

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
