

# catalog-server
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/catalog-server)](https://artifacthub.io/packages/helm/radar-base/catalog-server)

![Version: 0.9.0](https://img.shields.io/badge/Version-0.9.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.11](https://img.shields.io/badge/AppVersion-0.8.11-informational?style=flat-square)

A Helm chart for RADAR-base catalogue server. This application creates RADAR-base topics in Kafka, registers schemas in Schema Registry and keeps a catalog of available source types.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/catalog-server>
* <https://github.com/RADAR-base/RADAR-Schemas/tree/master/java-sdk>

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
| dev_deployment | bool | `false` | Deploy with settings for development (e.g., num_brokers = 1) |
| replicaCount | int | `1` | Number of catalog-server replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-schemas-tools"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override catalog-server.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override catalog-server.fullname template with a string |
| podSecurityContext | object | `{"fsGroup":101}` | Configure catalog-server pods' Security Context |
| securityContext | object | `{}` | Configure Appconfig containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `9010` | catalog-server port |
| resources.requests | object | `{"cpu":"100m","memory":"256Mi"}` | CPU/Memory resource requests |
| persistence.enabled | bool | `true` | Enable persistence using PVC |
| persistence.accessMode | string | `"ReadWriteOnce"` | PVC Access Mode for catalog-server volume |
| persistence.size | string | `"5Mi"` | PVC Storage Request for catalog-server volume |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVarsInit | list | `[]` | Extra environment variables |
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
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| kafka_num_brokers | int | `3` | Number of deployed Kafka brokers |
| kafka_num_replication | int | `3` | Number of Kafka Topic replicates. Should be min 2, max 4, and is normally 3, but is limited by the number of brokers. ref: https://learn.conduktor.io/kafka/kafka-topics-choosing-the-replication-factor-and-partitions-count/ |
| kafka_num_partitions | int | `3` | Number of Kafka Topic data partitions, Rule of thumb 3 times the number of brokers. Headroom is used for future upscale of brokers. ref: https://learn.conduktor.io/kafka/kafka-topics-choosing-the-replication-factor-and-partitions-count/ |
| kafka | string | `"radar-kafka-bootstrap:9094"` | URI of Kafka brokers On strimzi operator, this points to the listener that has no tls, and scram-sha-512 authentication. |
| schema_registry | string | `"http://radar-schema-registry:8081"` | URL of the confluent schema registry |
| kafkaProperties | object | `{"sasl_mechanism":"SCRAM-SHA-512","security_protocol":"SASL_PLAINTEXT"}` | Additional kafka properties such as security config. The template replaces `_` with `.` in keys so property keys can be specified using `_` instead of `.`. For example `security_protocol` is same as `security.protocol` kafka config. |
| kafkaProperties.security_protocol | string | `"SASL_PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| kafkaProperties.sasl_mechanism | string | `"SCRAM-SHA-512"` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
| secret.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| sources.include | list | `[]` | Only include given specification directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String-> If include is specified, exclude will be ignored. The glob pattern should start from the specifications directory. |
| sources.exclude | list | `[]` | Exclude all given specification directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String-> If include is specified, exclude will be ignored. The glob pattern should start from the specifications directory. |
| sources.active | list | `[]` | active source specification, as done in RADAR-schemas/specifications/active. The array elements should be the full YAML specification. |
| sources.connector | list | `[]` | connector source specification, as done in RADAR-schemas/specifications/connector. The array elements should be the full YAML specification. |
| sources.monitor | list | `[]` | monitor source specification, as done in RADAR-schemas/specifications/monitor. The array elements should be the full YAML specification. |
| sources.passive | list | `[]` | passive source specification, as done in RADAR-schemas/specifications/passive. The array elements should be the full YAML specification. |
| sources.push | list | `[]` | push source specification, as done in RADAR-schemas/specifications/push. The array elements should be the full YAML specification. |
| sources.stream | list | `[]` | stream source specification, as done in RADAR-schemas/specifications/stream. The array elements should be the full YAML specification. |
| schemas.include | list | `[]` | Only include given schema directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String->. If include is specified, exclude will be ignored. The glob pattern should start from the commons directory. |
| schemas.exclude | list | `[]` | Exclude all given schema directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String->. If include is specified, exclude will be ignored. The glob pattern should start from the commons directory. |
| schemas.active | object | `{}` | active record schemas, as done in RADAR-schemas/commons/active. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.catalogue | object | `{}` | catalogue record schemas, as done in RADAR-schemas/commons/catalogue. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.connector | object | `{}` | connector record schemas, as done in RADAR-schemas/commons/connector. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.kafka | object | `{}` | catalogue record schemas, as done in RADAR-schemas/commons/kafka. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.monitor | object | `{}` | monitor record schemas, as done in RADAR-schemas/commons/monitor. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.passive | object | `{}` | passive record schemas, as done in RADAR-schemas/commons/passive. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.push | object | `{}` | push record schemas, as done in RADAR-schemas/commons/push. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.stream | object | `{}` | stream record schemas, as done in RADAR-schemas/commons/stream. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| cc.enabled | bool | `false` | set to true if using Confluent Cloud for kafka cluster and schema registry |
| cc.bootstrapServerurl | string | `"confluent-url"` | URL of the bootstrap server of Confluent Cloud based kafka cluster |
| cc.apiKey | string | `"ccApikey"` | API key of the Confluent Cloud based kafka cluster |
| cc.apiSecret | string | `"ccApiSecret"` | API secret of the Confluent Cloud based kafka cluster |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | API key of the Confluent Cloud based schema registry |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | API secret of the Confluent Cloud based schema registry |
