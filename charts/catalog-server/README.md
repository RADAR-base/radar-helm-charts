

# catalog-server

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.0](https://img.shields.io/badge/AppVersion-0.8.0-informational?style=flat-square)

A Helm chart for RADAR-base catalogue server. This application creates RADAR-base topics in Kafka, registers schemas in Schema Registry and keeps a catalog of available source types.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/RADAR-Schemas/tree/master/java-sdk>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+
* PV provisioner support in the underlying infrastructure

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of catalog-server replicas to deploy |
| image.repository | string | `"radarbase/radar-schemas-tools"` | catalog-server image repository |
| image.tag | string | `"0.8.0"` | catalog-server image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | catalog-server image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
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
| kafka_num_brokers | int | `3` | number of Kafka brokers to look for |
| kafka | string | `"cp-kafka-headless:9092"` | URI of Kafka brokers |
| schema_registry | string | `"http://cp-schema-registry:8081"` | URL of the confluent schema registry |
| kafkaProperties | object | `{"security_protocol":"PLAINTEXT"}` | Additional kafka properties such as security config. The template replaces `_` with `.` in keys so property keys can be specified using `_` instead of `.`. For example `security_protocol` is same as `security.protocol` kafka config. |
| kafkaProperties.security_protocol | string | `"PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| sources.include | list | `[]` | Only include given specification directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String-> If include is specified, exclude will be ignored. The glob pattern should start from the specifications directory. |
| sources.exclude | list | `[]` | Exclude all given specification directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String-> If include is specified, exclude will be ignored. The glob pattern should start from the specifications directory. |
| sources.active | object | `{}` | active source specifications, as done in RADAR-schemas/specifications/active. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| sources.connector | object | `{}` | connector source specifications, as done in RADAR-schemas/specifications/connector. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| sources.monitor | object | `{}` | monitor source specifications, as done in RADAR-schemas/specifications/monitor. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| sources.passive | object | `{}` | passive source specifications, as done in RADAR-schemas/specifications/passive. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| sources.push | object | `{}` | push source specifications, as done in RADAR-schemas/specifications/push. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| sources.stream | object | `{}` | stream source specifications, as done in RADAR-schemas/specifications/stream. The object fields should be the file name, e.g. `application/application_uptime.avsc`. |
| schemas.include | list | `[]` | Only include given schema directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String->. If include is specified, exclude will be ignored. The glob pattern should start from the commons directory. |
| schemas.exclude | list | `[]` | Exclude all given schema directory files. You can use File glob syntax as described in <https://docs.oracle.com/javase/8/docs/api/java/nio/file/FileSystem.html#getPathMatcher-java.lang.String->. If include is specified, exclude will be ignored. The glob pattern should start from the commons directory. |
| schemas.active | list | `[]` | active schema specification, as done in RADAR-schemas/specifications/active. The array elements should be the full YAML specification. |
| schemas.catalogue | list | `[]` | catalogue schema specification, as done in RADAR-schemas/specifications/catalogue. The array elements should be the full YAML specification. |
| schemas.connector | list | `[]` | connector schema specification, as done in RADAR-schemas/specifications/connector. The array elements should be the full YAML specification. |
| schemas.kafka | list | `[]` | kafka schema specification, as done in RADAR-schemas/specifications/kafka. The array elements should be the full YAML specification. |
| schemas.monitor | list | `[]` | monitor schema specification, as done in RADAR-schemas/specifications/monitor. The array elements should be the full YAML specification. |
| schemas.passive | list | `[]` | passive schema specification, as done in RADAR-schemas/specifications/passive. The array elements should be the full YAML specification. |
| schemas.push | list | `[]` | push schema specification, as done in RADAR-schemas/specifications/push. The array elements should be the full YAML specification. |
| schemas.stream | list | `[]` | stream schema specification, as done in RADAR-schemas/specifications/stream. The array elements should be the full YAML specification. |
| cc.enabled | bool | `false` | set to true if using Confluent Cloud for kafka cluster and schema registry |
| cc.bootstrapServerurl | string | `"confluent-url"` | URL of the bootstrap server of Confluent Cloud based kafka cluster |
| cc.apiKey | string | `"ccApikey"` | API key of the Confluent Cloud based kafka cluster |
| cc.apiSecret | string | `"ccApiSecret"` | API secret of the Confluent Cloud based kafka cluster |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | API key of the Confluent Cloud based schema registry |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | API secret of the Confluent Cloud based schema registry |
