

# velero-s3-deployment
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/velero-s3-deployment)](https://artifacthub.io/packages/helm/radar-base/velero-s3-deployment)

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for Velero S3 deployment, this chart holds resources used by Velero with a deployment to mirror the local object storage to a remote object storage.

**Homepage:** <https://velero.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/velero-s3-deployment>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+
* S3-compatible object storage

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | velero | 2.30.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| objectStorageBackupReplicaCount | int | `1` | Number of replicas for object storage backup pod, should be 1 |
| mc_image.repository | string | `"minio/mc"` | Object storage backup pod image repository |
| mc_image.tag | string | `nil` | Object storage backup pod image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| mc_image.pullPolicy | string | `"IfNotPresent"` | Object storage backup pod image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| podSecurityContext | object | `{}` | Configure object storage backup pod pods' Security Context |
| securityContext | object | `{}` | Configure object storage backup pod containers' Security Context |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| local.address | string | `"minio.default:9000"` | Address of local object storage to backup data from |
| local.accessKey | string | `"accessKey"` | Access key of local object storage |
| local.secretKey | string | `"secretKey"` | Secret key of local object storage |
| local.intermediateBucketName | string | `"radar-intermediate-storage"` | Name of local intermediate data bucket |
| local.outputBucketName | string | `"radar-output-storage"` | Name of local output data bucket |
| backup.address | string | `"s3.example.com"` | Address of remote object storage to backup data to |
| backup.accessKey | string | `"accessKey"` | Access key of remote object storage |
| backup.secretKey | string | `"secretKey"` | Secret key of remote object storage |
| backup.intermediateBucketName | string | `"radar-intermediate-storage"` | Name of remote intermediate data bucket |
| backup.outputBucketName | string | `"radar-output-storage"` | Name of remote output data bucket |
| velero | object | `{"configuration":{"backupStorageLocation":{"bucket":"radar-base-backups","config":{"region":"eu-central-1","s3ForcePathStyle":"true","s3Url":"https://s3.amazon.com"},"name":"default"},"provider":"aws"},"credentials":{"secretContents":{"cloud":"[default]\naws_access_key_id=accessKey\naws_secret_access_key=secretKey\n"}},"deployRestic":true,"initContainers":[{"image":"velero/velero-plugin-for-aws:v1.5.0","imagePullPolicy":"IfNotPresent","name":"velero-plugin-for-aws","volumeMounts":[{"mountPath":"/target","name":"plugins"}]}],"kubectl":{"image":{"tag":"1.26.14-debian-11-r6"}},"metrics":{"enabled":true,"serviceMonitor":{"enabled":true}},"restic":{"podVolumePath":"/var/lib/kubelet/pods","privileged":false},"schedules":{"backup":{"schedule":"0 3 * * *","template":{"includeClusterResources":true,"includedNamespaces":["cert-manager","default","graylog","kubernetes-dashboard","monitoring","velero"],"snapshotVolumes":false,"ttl":"240h"}}},"snapshotsEnabled":false}` | -- |
| velero.initContainers | list | check values.yaml | Add plugins to enable using different storage systems, AWS plugin is needed to be able to push to S3-compatible object storages |
| velero.metrics.enabled | bool | `true` | Enable monitoring metrics to be collected |
| velero.metrics.serviceMonitor.enabled | bool | `true` | Enable prometheus-operator interface |
| velero.configuration.provider | string | `"aws"` | Cloud provider being used (e.g. aws, azure, gcp). |
| velero.configuration.backupStorageLocation | object | Check below | Parameters for the `default` BackupStorageLocation. See https://velero.io/docs/v1.0.0/api-types/backupstoragelocation/ |
| velero.configuration.backupStorageLocation.name | string | `"default"` | Cloud provider where backups should be stored. Usually should match `configuration.provider`. Required. |
| velero.configuration.backupStorageLocation.bucket | string | `"radar-base-backups"` | Bucket to store backups in. Required. |
| velero.configuration.backupStorageLocation.config | object | Check values.yaml | Additional provider-specific configuration. See link above for details of required/optional fields for your provider. |
| velero.credentials.secretContents.cloud | string | Check values.yaml | Check |
| velero.snapshotsEnabled | bool | `false` | Don't snapshot volumes where they're not supported |
| velero.deployRestic | bool | `true` | Deploy restic to backup Kubernetes volumes |
| velero.restic.podVolumePath | string | `"/var/lib/kubelet/pods"` | Path to find pod volumes |
| velero.restic.privileged | bool | `false` | Shouldn't need privilege to backup the volumes |
| velero.schedules.backup.schedule | string | `"0 3 * * *"` | Backup every day at 3:00 AM |
| velero.schedules.backup.template.ttl | string | `"240h"` | Keep backup for 10 days |
| velero.schedules.backup.template.includeClusterResources | bool | `true` | Backup cluster wide resources |
| velero.schedules.backup.template.snapshotVolumes | bool | `false` | Don't snapshot volumes where they're not supported |
| velero.schedules.backup.template.includedNamespaces | list | Check values.yaml | Namespaces to backup manifests and volumes from |
