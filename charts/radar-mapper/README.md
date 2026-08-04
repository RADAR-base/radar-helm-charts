

# radar-mapper

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart for RADAR-base radar-mapper. Reads CDISC ODM XML files produced by radar-output-restructure, enriches subject identifiers and REDCap event names via Management Portal and CSV lookup tables, and writes enriched ODM XML ready for REDCap import. Runs as a Kubernetes CronJob.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pauline Conde | <pauline.conde@kcl.ac.uk> |  |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> |  |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-mapper>
* <https://github.com/RADAR-base/radar-mapper>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-mapper/radar-mapper"` | Image repository |
| image.tag | string | `nil` | Image tag. Defaults to the chart appVersion. |
| image.digest | string | `""` | Image digest (overrides tag when set, e.g. sha256:aa...) |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optional image pull secrets e.g: pullSecrets:   - myRegistryKeySecretName |
| nameOverride | string | `""` | String to partially override radar-mapper.fullname (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-mapper.fullname |
| commonLabels | object | `{}` | Labels to add to all deployed objects |
| commonAnnotations | object | `{}` | Annotations to add to all deployed objects |
| schedule | string | `"*/5 * * * *"` | Cron schedule expression (UTC). Runs every 5 minutes for testing. Change for prod. |
| concurrencyPolicy | string | `"Forbid"` | Forbid concurrent runs to prevent duplicate enrichment writes. |
| failedJobsHistoryLimit | int | `3` | Number of failed Job records to retain for debugging. |
| successfulJobsHistoryLimit | int | `1` | Number of successful Job records to retain. |
| backoffLimit | int | `2` | Number of pod-level retries before the Job is marked as failed. radar-mapper exits non-zero when enrichment fails; retrying is intentional. |
| startingDeadlineSeconds | int | `300` | Deadline in seconds for a Job that has not started yet. |
| podSecurityContext | object | `{}` | Configure pod-level Security Context |
| securityContext | object | `{"allowPrivilegeEscalation":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":1000}` | Configure container-level Security Context |
| resources.limits | object | `{"cpu":"500m","memory":"512Mi"}` | CPU/Memory resource limits |
| resources.requests | object | `{"cpu":"100m","memory":"256Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables injected into the container |
| existingSecret | string | `""` | Name of an existing Secret to use for credentials. When set, the chart does not create a Secret; supply your own with the keys:   sourceS3AccessToken, sourceS3SecretKey,   destS3AccessToken,   destS3SecretKey,   mpClientSecret Leave blank to let the chart create a Secret from the values below. |
| source.type | string | `"s3"` | Storage backend: local or s3 |
| source.path | string | `"odm/"` | Object-key prefix within the S3 bucket (or local filesystem path) |
| source.s3.endpoint | string | `"http://minio:9000"` | S3 / MinIO endpoint URL |
| source.s3.bucket | string | `"radar-output-storage"` | S3 bucket containing radar-output-restructure ODM output |
| source.s3.accessToken | string | `""` | S3 access key (stored in Secret) |
| source.s3.secretKey | string | `""` | S3 secret key (stored in Secret) |
| destination.type | string | `"s3"` | Storage backend: local or s3 |
| destination.path | string | `"enriched/"` | Object-key prefix within the S3 bucket (or local filesystem path) |
| destination.s3.endpoint | string | `"http://minio:9000"` | S3 / MinIO endpoint URL |
| destination.s3.bucket | string | `"radar-mapper-output"` | S3 bucket for enriched ODM output |
| destination.s3.accessToken | string | `""` | S3 access key (stored in Secret) |
| destination.s3.secretKey | string | `""` | S3 secret key (stored in Secret) |
| managementPortal.url | string | `"http://management-portal:8080/managementportal"` | Base URL of the Management Portal |
| managementPortal.clientId | string | `"radar_mapper"` | OAuth2 client ID for radar-mapper (stored in ConfigMap) |
| managementPortal.clientSecret | string | `""` | OAuth2 client secret (stored in Secret) |
| managementPortal.tokenUrl | string | `"http://hydra-public:4444/oauth2/token"` | OAuth2 token endpoint URL. Leave blank to derive it automatically as `{url}/oauth/token` (Management Portal built-in auth). Set to a Hydra URL for Hydra-based deployments, e.g.:   tokenUrl: "http://radar-hydra-public:4444/oauth2/token" |
| managementPortal.scope | string | `"SUBJECT.READ PROJECT.READ"` | OAuth2 scope(s) to request. Optional; leave blank to omit from the token request. |
| managementPortal.audience | string | `"res_ManagementPortal"` | OAuth2 audience. Optional; leave blank to omit from the token request. |
| enrichment[0].name | string | `"record_id"` | Slot name, used as the key in enriched fields |
| enrichment[0].sourceField | string | `"SubjectKey"` | MappedRecord field to use as the lookup key |
| enrichment[0].outputField | string | `"SubjectKey"` | Output field to write the enriched value into (defaults to slot name) |
| enrichment[0].provider.type | string | `"management_portal"` | Provider type: management_portal or csv |
| enrichment[0].provider.projects | list | `[]` | RADAR project name(s) to fetch subjects from. Use a list for multiple projects; a single string is also accepted. |
| enrichment[0].provider.subjectAttribute | string | `"REDCapRecordId"` | Subject attribute key holding the REDCap record ID |
| enrichment[0].onMissing | string | `"warn"` | Behaviour when a subject has no record_id attribute: warn, skip, or fail |
| enrichment[1].name | string | `"event_name"` | Slot name, used as the key in enriched fields |
| enrichment[1].sourceFields | list | `["StudyEventOID","StudyOID"]` | Ordered list of record fields to form the composite lookup key |
| enrichment[1].outputField | string | `"StudyEventOID"` | Output field to write the enriched value into (defaults to slot name) |
| enrichment[1].provider.type | string | `"csv"` |  |
| enrichment[1].provider.path | string | `"/etc/radar-mapper/event-lookup.csv"` |  |
| enrichment[1].provider.keyColumns[0] | string | `"questionnaireName"` |  |
| enrichment[1].provider.keyColumns[1] | string | `"projectId"` |  |
| enrichment[1].provider.valueColumn | string | `"eventName"` |  |
| enrichment[1].provider.lookupCsv | string | `"questionnaireName,projectId,eventName\n# Weekly|W1,MY-PROJECT,week_1_participant_arm_1\n# Weekly|W6,MY-PROJECT,month_3_participant_arm_1\n"` | Inline content of the CSV file mounted at the provider path above. Format: questionnaireName,projectId,eventName |
| enrichment[1].onMissing | string | `"warn"` | Behaviour when no event name mapping is found: warn, skip, or fail |
| filter.excludeItems | list | `[]` | Item OIDs to strip from every record before writing. The record is kept; only the matching items are removed. Use this for instruction or display-only items that should not appear in the destination output (e.g. pacq_instructions_1). |
| networkpolicy | object | check `values.yaml` | Network policy defines pod egress rules. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
