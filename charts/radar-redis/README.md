

# radar-redis
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-redis)](https://artifacthub.io/packages/helm/radar-base/radar-redis)

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v8.2.2](https://img.shields.io/badge/AppVersion-v8.2.2-informational?style=flat-square)

Redis charts for Radar-base

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

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
| fullnameOverride | string | `"redis-radar"` |  |
| image.registry | string | `"quay.io"` | Image registry |
| image.repository | string | `"opstree/redis"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| clusterVersion | string | `"v7"` |  |
| mode | string | `"replication"` | Can be either standalone, replication or cluster. Standalone mode deploys a single redis instance for development purposes. note: radar-output is not compatible with cluster mode |
| multi | object | `{"nodeConfVolume":true,"nodeConfVolumeClaimTemplate":{"spec":{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"1Gi"}}}},"replicates":3}` | Used when mode is cluster or replication. |
| multi.replicates | int | `3` | Number of redis nodes |
| resources.requests | object | `{"cpu":"101m","memory":"128Mi"}` | resource requests for redis pods |
| resources.limits | object | `{"cpu":"101m","memory":"128Mi"}` | resource limits for redis pods |
| storage.accessModes | list | `["ReadWriteOnce"]` | Access mode for PVC |
| storage.size | string | `"1Gi"` | Size of PVC |
| securityContext | object | `{"fsGroup":1000,"runAsUser":1000}` | Security context for redis pods |
| redisExporter.image.registry | string | `"quay.io"` |  |
| redisExporter.image.repository | string | `"opstree/redis-exporter"` |  |
| redisExporter.image.tag | string | `"v1.44.0"` |  |
| redisExporter.image.pullPolicy | string | `"IfNotPresent"` |  |
| redisExporter.securityContext | object | `{"fsGroup":1000,"runAsUser":1000}` | Security context for redis node exporter pods |
| metrics.enabled | bool | `true` |  |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
