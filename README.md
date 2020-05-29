# Why?

Kubernetes administrators manage multiple clusters, each cluster might have a different combination of tools versions, for example:

* Cluster 001: kubectl v1.15.0, helm v2.13.0, velero v1.0.0, fluxctl 1.19.0

* Cluster 002: kubectl v1.17.0, helm v2.16.0, velero v1.2.0, fluxctl 1.10.0

* Cluster 003: another completly different stack of tools...

Even though some tools have version compatibilty, it is always safier to use the same "server and client" versions.

# How to use kube-rowing

## Download app's binaries

```
./download/_all.sh
```

## Docker run examples

You can make any combination you want.

```
helm="2.16.7"
kubectl="1.18.0"
velero="1.0.0"
docker run --rm -ti --name cluster001-mgmt \
  -v $HOME/.kube/config/:/root/.kube/config \
  -v "`pwd`/dist/helm/$helm/linux-amd64/helm":/usr/local/bin/helm \
  -v "`pwd`/dist/helm/$helm/linux-amd64/tiller":/usr/local/bin/tiller \
  -v "`pwd`/dist/kubectl/$kubectl/kubectl":/usr/local/bin/kubectl \
  -v "`pwd`/dist/velero/$velero/velero-v$velero-linux-amd64/velero":/usr/local/bin/velero \
  ubuntu:18.04
```