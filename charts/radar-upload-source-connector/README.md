



# radar-upload-source-connector
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-upload-source-connector)](https://artifacthub.io/packages/helm/radar-base/radar-upload-source-connector)


![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.5.10](https://img.shields.io/badge/AppVersion-0.5.10-informational?style=flat-square) 

A Helm chart for RADAR-base upload kafka connector. This is used for reading uploaded data from backend and sending them to Kafka cluster for later processing.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-upload-source-connector>
* <https://github.com/RADAR-base/radar-upload-source-connector>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+



## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-upload-source-connector replicas to deploy |
| image.repository | string | `"radarbase/radar-connect-upload-source"` | radar-upload-source-connector image repository |
| image.tag | string | `"0.5.10"` | radar-upload-source-connector image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-upload-source-connector.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-upload-source-connector.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-upload-source-connector pods' Security Context |
| securityContext | object | `{}` | Configure radar-upload-source-connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `80` | radar-upload-source-connector port |
| resources.requests | object | `{"cpu":"100m","memory":"800Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"PLAINTEXT"}]` | Additional environment variables to pass to the connector. These can be used to pass supported kafka and connect specifc [configs](https://docs.confluent.io/platform/current/installation/docker/config-reference.html#kconnect-long-configuration) |
| extraEnvVars[0] | object | `{"name":"CONNECT_SECURITY_PROTOCOL","value":"PLAINTEXT"}` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `60` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `60` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| zookeeper | string | `"cp-zookeeper-headless:2181"` | Zookeeper URL |
| kafka | string | `"PLAINTEXT://cp-kafka-headless:9092"` | Kafka broker URLs |
| kafka_num_brokers | string | `"3"` | Number of brokers in the cluster |
| schema_registry | string | `"http://cp-schema-registry:8081"` | Schema registry URL |
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
| task.queueSize | int | `10000` | Maximum number of source records that can be produced at a time, preventing out of memory errors. |
| connect.offsetFlushIntervalMs | int | `5000` | Interval at which to try committing offsets for tasks. See |
| producer | object | Check below | Override kafka producer configs. For more details see https://docs.confluent.io/platform/current/installation/configuration/producer-configs.html |
| producer.compressionType | string | `"lz4"` | The compression type for all data generated by the producer. |
| producer.bufferMemory | int | `2000000` | The total bytes of memory the producer can use to buffer records waiting to be sent to the server. |
| producer.batchSize | int | `200000` | Batch size in bytes to batch records together into fewer requests when multiple records are being sent to the same partition. |
