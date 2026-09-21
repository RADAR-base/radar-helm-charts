

# radar-iceberg-maintenance
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-iceberg-maintenance)](https://artifacthub.io/packages/helm/radar-base/radar-iceberg-maintenance)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 480](https://img.shields.io/badge/AppVersion-480-informational?style=flat-square)

Scheduled maintenance for RADAR's Iceberg tables - compaction, snapshot expiry and orphan-file removal, run as SQL against Trino.

**Homepage:** <https://radar-base.org>

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-iceberg-maintenance>

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
| nameOverride | string | `""` | String to partially override the fullname template (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override the fullname template |
| commonLabels | object | `{}` | Labels added to all resources of this chart |
| commonAnnotations | object | `{}` | Annotations added to all resources of this chart |
| image.registry | string | `"docker.io"` | Image registry. The Trino image ships the CLI these jobs use. |
| image.repository | string | `"trinodb/trino"` | Image repository |
| image.tag | string | `"480"` | Image tag. Keep aligned with the deployed Trino server version. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets |
| trino.url | string | `"http://trino:8080"` | Trino coordinator URL these jobs submit SQL to |
| trino.catalog | string | `"iceberg"` | Trino catalog holding the Iceberg tables |
| trino.schema | string | `"radar"` | Schema (Iceberg namespace) holding the tables |
| trino.user | string | `"iceberg-maintenance"` | User the jobs authenticate as. Its queries appear in the Trino audit log under this name, so keep it distinct from any human account. |
| trino.passwordSecret | object | `{"key":"password","name":""}` | Optional Secret providing a password for `trino.user`, set as TRINO_PASSWORD |
| trino.passwordSecret.name | string | `""` | Name of an existing Secret. Empty disables password authentication. |
| trino.passwordSecret.key | string | `"password"` | Key within that Secret |
| tables | list | `[]` | Restrict maintenance to these tables. Empty means "every table in the schema", discovered at run time with SHOW TABLES. |
| resources | object | `{"requests":{"cpu":"50m","memory":"128Mi"}}` | CPU/Memory resources for the maintenance pods. These jobs submit SQL and wait; the work happens on the Trino workers. |
| jobs.compaction.enabled | bool | `true` | Merge small files. The most valuable of the three for a streaming sink. |
| jobs.compaction.schedule | string | `"0 2 * * *"` | Cron schedule. Off-peak: compaction and the sink both write, and although Iceberg's atomic swap makes a conflict a retry rather than a corruption, there is no reason to provoke retries during the busy part of the day. |
| jobs.compaction.fileSizeThreshold | string | `"128MB"` | Files below this size are candidates for rewriting |
| jobs.expireSnapshots.enabled | bool | `true` | Drop snapshots older than the retention window and delete what only they referenced. |
| jobs.expireSnapshots.schedule | string | `"30 3 * * *"` | Cron schedule |
| jobs.expireSnapshots.retentionThreshold | string | `"7d"` | How much history to keep. This is a GOVERNANCE parameter, not a tuning knob: it is simultaneously how far back time travel reaches and how long after a DELETE the rows physically survive. Agree it, then set it here. |
| jobs.removeOrphanFiles.enabled | bool | `true` | Delete files that no snapshot references, left behind by interrupted commits. |
| jobs.removeOrphanFiles.schedule | string | `"0 5 * * 0"` | Cron schedule. Weekly is enough. |
| jobs.removeOrphanFiles.retentionThreshold | string | `"7d"` | Safety margin. Must comfortably exceed the sink's commit interval, or this deletes files belonging to a commit that is still in progress. |
| successfulJobsHistoryLimit | int | `3` | Number of successful finished jobs to retain |
| failedJobsHistoryLimit | int | `3` | Number of failed finished jobs to retain |
| startingDeadlineSeconds | int | `300` | Deadline in seconds for starting the job if it misses its scheduled time |
| backoffLimit | int | `2` | Number of retries before a job is considered failed |
| concurrencyPolicy | string | `"Forbid"` | Concurrency policy. Forbid: never run two of the same chore at once. |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this application has access to |
