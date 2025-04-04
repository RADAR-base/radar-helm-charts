

# radar-timescaledb
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-timescaledb)](https://artifacthub.io/packages/helm/radar-base/radar-timescaledb)
> **:exclamation: This Helm Chart is deprecated!**

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![AppVersion: latest-pg12-bitnami](https://img.shields.io/badge/AppVersion-latest--pg12--bitnami-informational?style=flat-square)

TimescaleDB is an open-source time-series database optimized for fast ingest and complex queries, built as an extension to PostgreSQL. It leverages PostgreSQL's reliability and ecosystem while adding time-series specific optimizations and features, such as automatic partitioning and compression.

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
| file://../../external/postgresql | postgresql | 12.1.9 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.image.repository | string | `"timescale/timescaledb"` |  |
| postgresql.image.tag | string | `"latest-pg12-bitnami"` |  |
| postgresql.image.pullPolicy | string | `"Always"` |  |
| postgresql.global.postgresql.auth.postgresPassword | string | `""` |  |
| postgresql.auth.postgresPassword | string | `""` |  |
| postgresql.auth.username | string | `""` |  |
| postgresql.auth.password | string | `""` |  |
| postgresql.auth.database | string | `"database"` |  |
| postgresql.replication.applicationName | string | `"radar"` |  |
| postgresql.primary.extraEnvVars | list | `[]` |  |
| postgresql.primary.podAnnotations."backup.velero.io/backup-volumes" | string | `"data"` |  |
| postgresql.primary.podAnnotations."post.hook.backup.velero.io/command" | string | `"[\"/bin/fsfreeze\", \"--unfreeze\", \"/bitnami/postgresql\"]"` |  |
| postgresql.primary.podAnnotations."post.hook.backup.velero.io/container" | string | `"fsfreeze"` |  |
| postgresql.primary.podAnnotations."pre.hook.backup.velero.io/command" | string | `"[\"/bin/fsfreeze\", \"--freeze\", \"/bitnami/postgresql\"]"` |  |
| postgresql.primary.podAnnotations."pre.hook.backup.velero.io/container" | string | `"fsfreeze"` |  |
| postgresql.primary.sidecars[0].name | string | `"fsfreeze"` |  |
| postgresql.primary.sidecars[0].image | string | `"busybox"` |  |
| postgresql.primary.sidecars[0].securityContext.privileged | bool | `true` |  |
| postgresql.primary.sidecars[0].volumeMounts[0].mountPath | string | `"/bitnami/postgresql"` |  |
| postgresql.primary.sidecars[0].volumeMounts[0].name | string | `"data"` |  |
| postgresql.primary.sidecars[0].volumeMounts[0].readOnly | bool | `false` |  |
| postgresql.primary.sidecars[0].command[0] | string | `"/bin/sh"` |  |
| postgresql.primary.sidecars[0].command[1] | string | `"-c"` |  |
| postgresql.primary.sidecars[0].command[2] | string | `"sleep infinity"` |  |
| postgresql.primary.persistence.enabled | bool | `true` |  |
| postgresql.primary.persistence.existingClaim | string | `""` |  |
| postgresql.primary.persistence.mountPath | string | `"/bitnami/postgresql"` |  |
| postgresql.primary.persistence.size | string | `"8Gi"` |  |
| postgresql.volumePermissions.enabled | bool | `true` |  |
| postgresql.metrics.enabled | bool | `true` |  |
