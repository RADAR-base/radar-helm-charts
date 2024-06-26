

# radar-s3-connector
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-s3-connector)](https://artifacthub.io/packages/helm/radar-base/radar-s3-connector)

![Version: 0.3.4](https://img.shields.io/badge/Version-0.3.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.6.0-hotfix](https://img.shields.io/badge/AppVersion-7.6.0--hotfix-informational?style=flat-square)

A Helm chart for RADAR-base s3 connector. This connector uses Confluent s3 connector with a custom data transformers. These configurations enable a sink connector. See full list of properties here https://docs.confluent.io/kafka-connect-s3-sink/current/configuration_options.html#s3-configuration-options

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-s3-connector>
* <https://github.com/RADAR-base/kafka-connect-transform-keyvalue>
* <https://docs.confluent.io/kafka-connect-s3-sink/current/configuration_options.html#s3-configuration-options>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of radar-s3-connector replicas to deploy |
| image.repository | string | `"radarbase/kafka-connect-transform-s3"` | radar-s3-connector image repository |
| image.tag | string | `"7.6.0-hotfix"` | radar-s3-connector image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-s3-connector image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-s3-connector.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-s3-connector.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-s3-connector pods' Security Context |
| kafkaHeapOpts | string | `"-Xms3g -Xmx4g"` | JVM Options |
| securityContext | object | `{}` | Configure radar-s3-connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-s3-connector port |
| resources.requests | object | `{"cpu":"100m","memory":"3Gi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"PLAINTEXT"}]` | Additional environment variables to pass to the connector. These can be used to pass supported kafka and connect specifc [configs](https://docs.confluent.io/platform/current/installation/docker/config-reference.html#kconnect-long-configuration) |
| extraEnvVars[0] | object | `{"name":"CONNECT_SECURITY_PROTOCOL","value":"PLAINTEXT"}` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `40` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `60` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `10` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `40` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `60` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `10` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| kafka_num_brokers | int | `3` | Number of deployed Kafka broker instances |
| kafka.url | string | `"PLAINTEXT://cp-kafka-headless:9092"` | Kafka broker URLs |
| schemaRegistry.url | string | `"http://cp-schema-registry:8081"` | Schema registry URL |
| catalogServer.url | string | `"http://catalog-server:9010"` | Catalog server URL |
| topics | string | `""` | List of topics to be consumed by the sink connector separated by comma. Topics defined in the catalog server will automatically be loaded if `initTopics.enabled` is true. |
| s3Endpoint | string | `"http://minio:9000/"` | Target S3 endpoint url |
| s3Tagging | bool | `false` | set to true, if S3 objects should be tagged with start and end offsets, as well as record count. |
| s3PartSize | int | `5242880` | The Part Size in S3 Multi-part Uploads. |
| s3Region | string | `nil` | The AWS region to be used the connector. Some compatibility layers require this. |
| flushSize | int | `10000` | Number of records written to store before invoking file commits. |
| rotateInterval | int | `900000` | The time interval in milliseconds to invoke file commits. |
| maxTasks | int | `4` | Number of tasks in the connector |
| bucketAccessKey | string | `"access_key"` | Access key of the target S3 bucket |
| bucketSecretKey | string | `"secret"` | Secret key of the target S3 bucket |
| bucketName | string | `"radar_intermediate_storage"` | Bucket name of the target S3 bucket |
| cc.enabled | bool | `false` | Set to true, if Confluent Cloud is used |
| cc.bootstrapServerurl | string | `""` | Confluent cloud based Kafka broker URL (if Confluent Cloud based Kafka cluster is used) |
| cc.schemaRegistryUrl | string | `""` | Confluent cloud based Schema registry URL (if Confluent Cloud based Schema registry is used) |
| cc.apiKey | string | `"ccApikey"` | API Key of the Confluent Cloud cluster |
| cc.apiSecret | string | `"ccApiSecret"` | API secret of the Confluent Cloud cluster |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | API Key of the Confluent Cloud Schema registry |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | API Key of the Confluent Cloud Schema registry |
| initTopics.enabled | bool | `true` | If true, fetch list of topics from catalog server |
| initTopics.image.repository | string | `"linuxserver/yq"` | Image repository to fetch topics with |
| initTopics.image.tag | string | `"3.2.2"` | Image tag to fetch topics with |
| initTopics.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy to fetch topics with |
