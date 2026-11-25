

# radar-seaweedfs
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-seaweedfs)](https://artifacthub.io/packages/helm/radar-base/radar-seaweedfs)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.48](https://img.shields.io/badge/AppVersion-4.48-informational?style=flat-square)

SeaweedFS S3-compatible object storage for RADAR-base, deployed via the SeaweedFS operator. Alternative to MinIO.

## SeaweedFS

This chart deploys a SeaweedFS cluster (masters, volume servers, filers and S3 gateways) as a `Seaweed` custom
resource, creates the RADAR-base S3 buckets as `Bucket` resources and configures the S3 identities. It needs the
[SeaweedFS operator](https://github.com/seaweedfs/seaweedfs-operator) (`radar/seaweedfs-operator`, vendored in
`external/seaweedfs-operator`) to be installed first, in a separate release: the operator chart installs the CRDs
that this chart's resources use.

The S3 API is served at `http://<fullname>-s3:8333`. Only the S3 API (which requires credentials),
the admin UI (password protected) and metrics are reachable from outside the SeaweedFS pods; the network policy
blocks the unauthenticated filer, master and volume server APIs.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-seaweedfs>
* <https://github.com/seaweedfs/seaweedfs>
* <https://github.com/seaweedfs/seaweedfs-operator>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` | String to partially override the fullname template (will maintain the release name). The SeaweedFS services are named after the fullname, e.g. `<fullname>-filer`. |
| fullnameOverride | string | `""` | String to fully override the fullname template |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"chrislusf/seaweedfs"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| replication | string | `"001"` | Replication of data volumes in the format "XYZ", where X, Y and Z are the number of extra copies in other data centers, in other racks and on other servers in the same rack. All volume servers of this chart run in the same data center and rack, so only Z has effect. "001" keeps one extra copy on another volume server, which needs at least 2 volume servers. Use "000" for a single volume server. |
| master.replicas | int | `3` | Number of master servers. Use an odd number (1, 3 or 5) for raft consensus. |
| master.volumeSizeLimitMB | string | `nil` | Maximum size of a single volume in MB. When a volume is full, a new one is created. If empty, it is derived from `volume.storage.size` and `volume.maxVolumes`, so that all volume slots fit on the volume server PVCs. |
| master.volumeGrowthCount | int | `2` | Number of volumes (times the number of copies) that is created for a bucket when it runs out of writable volumes, including its first write. Every bucket needs this many free volume slots on the volume servers. SeaweedFS's default is 7. |
| master.persistence.size | string | `"1Gi"` | Size of the master PVC, which holds the raft log and snapshots. |
| master.persistence.storageClassName | string | `nil` | Storage class of the master PVC. Uses the cluster default if empty. |
| master.requests | object | `{}` | Resource requests of the master servers, e.g. `{cpu: 100m, memory: 128Mi}` |
| master.limits | object | `{}` | Resource limits of the master servers |
| volume.replicas | int | `2` | Number of volume servers. Must be at least 1 + the Z in `replication`. |
| volume.maxVolumes | int | `32` | Number of volume slots of each volume server. Each bucket takes `master.volumeGrowthCount` slots on its first write and more as its volumes fill up. Writes to a bucket fail when no slot is free. |
| volume.storage.size | string | `"20Gi"` | Size of the PVC of each volume server. Replicated data is stored on multiple volume servers, so the usable capacity is `replicas * size / (1 + Z)` with Z from `replication`. |
| volume.storage.storageClassName | string | `nil` | Storage class of the volume server PVCs. Uses the cluster default if empty. |
| volume.requests | object | `{}` | Resource requests of the volume servers, e.g. `{cpu: 100m, memory: 256Mi}` |
| volume.limits | object | `{}` | Resource limits of the volume servers |
| filer.replicas | int | `2` | Number of filers |
| filer.persistence.size | string | `"2Gi"` | Size of the PVC of each filer, which holds the file metadata (leveldb2 store). |
| filer.persistence.storageClassName | string | `nil` | Storage class of the filer PVCs. Uses the cluster default if empty. |
| filer.requests | object | `{}` | Resource requests of the filers, e.g. `{cpu: 100m, memory: 256Mi}` |
| filer.limits | object | `{}` | Resource limits of the filers |
| s3.identities | object | `radar` identity with read/write access to all buckets, credentials must be set | S3 identities, keyed by name. Each identity has `credentials.accessKey`, `credentials.secretKey` and a list of `actions`: `Admin`, `Read`, `Write`, `List` or `Tagging`, optionally limited to a bucket (e.g. `Read:radar-output-storage`). Every identity must have credentials: without any identity, SeaweedFS would allow anonymous access. |
| s3.replicas | int | `1` | Number of S3 gateways |
| s3.requests | object | `{}` | Resource requests of the S3 gateways, e.g. `{cpu: 100m, memory: 256Mi}` |
| s3.limits | object | `{}` | Resource limits of the S3 gateways |
| s3.ingress.enabled | bool | `false` | Expose the S3 API through an ingress |
| s3.ingress.className | string | `"nginx"` | Ingress class name |
| s3.ingress.host | string | `""` | Host name of the S3 API, e.g. `api.s3.example.com` |
| s3.ingress.annotations | object | check `values.yaml` | Ingress annotations |
| s3.ingress.tls | bool | `true` | Enable TLS with a certificate in secret `<fullname>-s3-tls` |
| buckets | list | `["radar-output-storage","radar-intermediate-storage","cloudnative-postgresql"]` | S3 buckets to create. They are created as operator `Bucket` resources with reclaim policy `Retain`, so removing a bucket from this list (or uninstalling the chart) does not delete its data. |
| waitForBuckets.enabled | bool | `true` | Run a post-install/upgrade hook Job that waits until the volume servers have free slots, the S3 gateway is up and all buckets exist, so that services that need the storage (e.g. the S3 sink connector) are not started before it is usable. |
| waitForBuckets.timeoutSeconds | int | `300` | Maximum time in seconds to wait for the buckets |
| waitForBuckets.image.registry | string | `"docker.io"` | Image registry of the wait job |
| waitForBuckets.image.repository | string | `"curlimages/curl"` | Image repository of the wait job |
| waitForBuckets.image.tag | string | `"8.22.0"` | Image tag of the wait job |
| admin.enabled | bool | `false` | Deploy the SeaweedFS admin UI (`weed admin`), a web console for the cluster and its buckets |
| admin.credentials.user | string | `"admin"` | Admin UI user name |
| admin.credentials.password | string | `""` | Admin UI password. Required when the admin UI is enabled. |
| admin.ingress.enabled | bool | `false` | Expose the admin UI through an ingress |
| admin.ingress.className | string | `"nginx"` | Ingress class name |
| admin.ingress.host | string | `""` | Host name of the admin UI, e.g. `s3.example.com` |
| admin.ingress.annotations | object | check `values.yaml` | Ingress annotations |
| admin.ingress.tls | bool | `true` | Enable TLS with a certificate in secret `<fullname>-admin-tls` |
| metrics.enabled | bool | `false` | Expose Prometheus metrics on all SeaweedFS components. The operator creates a ServiceMonitor for each component if the Prometheus operator CRDs are installed. |
| metrics.port | int | `9327` | Metrics port |
| networkPolicy.enabled | bool | `true` | Restrict access to the SeaweedFS pods. Other pods can only reach the S3 API, the admin UI and the metrics port; the filer, master and volume server APIs, which do not authenticate requests, are only reachable from the SeaweedFS pods themselves, the SeaweedFS operator and this chart's jobs. |
| networkPolicy.operatorPodLabels | object | `{"app.kubernetes.io/name":"seaweedfs-operator"}` | Labels of the SeaweedFS operator pods, which need access to the masters and filers. |
| networkPolicy.extraIngress | list | `[]` | Extra ingress rules, e.g. to give a backup job access to the filer API |
