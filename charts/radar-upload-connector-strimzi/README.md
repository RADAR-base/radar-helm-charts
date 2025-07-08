

# radar-upload-connector-strimzi
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-upload-connector-strimzi)](https://artifacthub.io/packages/helm/radar-base/radar-upload-connector-strimzi)

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.9.0](https://img.shields.io/badge/AppVersion-3.9.0-informational?style=flat-square)

A Helm chart for RADAR-base upload kafka connector. This is used for reading uploaded data from backend and sending them to Kafka cluster for later processing.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-upload-source-connector>
* <https://github.com/RADAR-base/radar-upload-source-connector>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* PV provisioner support in the underlying infrastructure

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of radar-upload-connector-strimzi replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-upload-connector"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override common.names.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override common.names.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-upload-connector-strimzi pods' Security Context |
| securityContext | object | `{}` | Configure radar-upload-connector-strimzi containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-upload-connector-strimzi port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| secret.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret name for the JAAS configuration |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| jvmOptions | object | `{"xms":"1500m","xmx":"2500m"}` | Java heap options |
| kafka | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | URI of Kafka brokers of the cluster |
| schema_registry | string | `"http://radar-kafka-schema-registry:8081"` | URL of the Kafka schema registry |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| radar_upload_connect_backend | string | `"radar-upload-connect-backend"` | Host name of the upload connect backend application |
| client_id | string | `"radar_upload_connect"` | OAuth2 Client Id of the Upload connector |
| client_secret | string | `"upload_secret"` | OAuth2 Client secret of the Upload connector |
| poll_interval | int | `60000` | How often the connector should poll for new records from upload connect backend in milliseconds. |
| record_converter_classes | string | Check values.yaml | List of converter classes to be activated as comma separated values. |
| uploaderType | string | `"s3"` | Uploader type for converters which directly write the files bypassing the Kafka processing. e.g. images and binaries. |
| s3Endpoint | string | `"http://minio:9000/"` | Target S3 endpoint, if files should be written to a location bypassing the Kafka processing. |
| bucketAccessKey | string | `"access_key"` | Target S3 access key |
| bucketSecretKey | string | `"secret"` | Target S3 secret key |
| targetBucketName | string | `"radar-output-storage"` | Target S3 bucket name |
| maxTasks | int | `2` | Maximum number of worker threads inside a connector pod. |
| task.queueSize | int | `10000` | Maximum number of source records that can be produced at a time, preventing out of memory errors. |
| connect.offsetFlushIntervalMs | int | `5000` | Interval at which to try committing offsets for tasks. See |
| producer | object | Check below | Override kafka producer configs. For more details see https://docs.confluent.io/platform/current/installation/configuration/producer-configs.html |
| producer.compressionType | string | `"lz4"` | The compression type for all data generated by the producer. |
| producer.bufferMemory | int | `2000000` | The total bytes of memory the producer can use to buffer records waiting to be sent to the server. |
| producer.batchSize | int | `200000` | Batch size in bytes to batch records together into fewer requests when multiple records are being sent to the same partition. |
| log4j | object | `{"rootLogLevel":"INFO"}` | Log4j configuration |
| log4j.rootLogLevel | string | `"INFO"` | Root log level for the Kafka Connect instance |
| sentry.dsn | string | `nil` | DSN (Data Source Name) of the sentry server |
| sentry.level | string | `"ERROR"` | Log level for sentry (TRACE, DEBUG, INFO, WARN, or ERROR) |
