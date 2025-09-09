

# radar-jdbc-connector
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-jdbc-connector)](https://artifacthub.io/packages/helm/radar-base/radar-jdbc-connector)

![Version: 0.10.1](https://img.shields.io/badge/Version-0.10.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.8.1](https://img.shields.io/badge/AppVersion-10.8.1-informational?style=flat-square)

A Helm chart for RADAR-base JDBC Kafka connector. This is a fork of the Kafka JDBC connector which allows data from topics to be imported into JDBC databases (including TimescaleDB databases which is used in the dashboard pipeline).

**Homepage:** <https://radar-base.org>

## CloudNativePG TimescaleDB

This chart deploys the CloudNativePG TimescaleDB via the _timescaledb_ chart. In turn,
_timescaledb_ uses the CloudNativePG operator chart to deploy the TimescaleDB database.
Configuration to the _timescaledb_ chart can be passed via the `timescaledb:` key in
the values.yaml file.

Deployment of CloudNativePG TimescaleDB can be disabled by setting `enabled: false` in the `timescaledb:` key.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-jdbc-connector>
* <https://github.com/RADAR-base/RADAR-JDBC-Connector>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../radar-cloudnative-timescaledb | timescaledb(radar-cloudnative-timescaledb) | 0.2.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of radar-jdbc-connector replicas to deploy |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-jdbc-connector"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-jdbc-connector.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-jdbc-connector.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-jdbc-connector pods' Security Context |
| securityContext | object | `{}` | Configure radar-jdbc-connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-jdbc-connector port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"},{"name":"CONNECT_CONSUMER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_CONSUMER_SASL_MECHANISM","value":"SCRAM-SHA-512"}]` | Additional environment variables to pass to the connector. These can be used to pass supported kafka and connect specific [configs](https://docs.confluent.io/platform/current/installation/docker/config-reference.html#kconnect-long-configuration) |
| extraEnvVars[0] | object | `{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"}` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. Needed by kafka_init script. |
| extraEnvVars[1] | object | `{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"}` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. Needed by kafka_init script. |
| extraEnvVars[2] | object | `{"name":"CONNECT_CONSUMER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"}` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| extraEnvVars[3] | object | `{"name":"CONNECT_CONSUMER_SASL_MECHANISM","value":"SCRAM-SHA-512"}` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
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
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| kafka | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | URI of Kafka brokers of the cluster |
| kafka_num_brokers | string | `"3"` | Number of Kafka brokers. This is used to validate the cluster availability at connector init. |
| schema_registry | string | `"http://radar-kafka-schema-registry:8081"` | URL of the Kafka schema registry |
| maxTasks | int | `2` | Maximum number of worker threads inside a connector pod. |
| mode | string | `"sink"` | Either source or sink |
| logLevel.root | string | `"INFO"` | Default log level |
| logLevel.loggers | object | `{"org.reflections":"ERROR"}` | Per-logger log-level |
| heapOpts | string | `"-Xms1500m"` | Java heap options |
| source.name | string | `"radar-jdbc-source"` | Name of the connector Kafka producer group |
| source.schema | string | `"public"` | Database schema (if any) |
| source.tableWhitelist | string | `""` | Comma-separated list of tables to read |
| source.topicPrefix | string | `""` | Prefix to prepend to table names to generate the name of the Kafka topic to publish data to. |
| source.mode | string | `"incrementing"` | How to detect new values in a table. |
| source.incrementingColumnName | string | `""` | When using mode incrementing, which column to use as incrementing. If empty, autodetection will be used. |
| source.keyField | string | `""` | Field to use as key for the records. If empty, no key is used. |
| source.persistence.enabled | bool | `true` | Whether to enable persistence for storing offsets |
| source.persistence.existingClaim | string | `nil` | Existing persistent volume claim to use |
| source.persistence.accessMode | string | `"ReadWriteOnce"` | PVC access mode |
| source.persistence.size | string | `"20Mi"` | PVC storage size request |
| sink.name | string | `"radar-jdbc-sink"` | Name of the connector Kafka consumer group |
| sink.autoCreate | bool | `true` | create table if it does not exist |
| sink.insertMode | string | `"upsert"` | How to insert new values into the database |
| sink.transforms.enabled | bool | `true` | Whether to merge the key fields into the inserted values. |
| sink.transforms.mergeKeyType | string | `"org.radarbase.kafka.connect.transforms.MergeKey"` | Class to handle merging the key into the record |
| sink.transforms.timestampType | string | `"org.radarbase.kafka.connect.transforms.TimestampConverter"` | Class to convert time-based fields into SQL timestamps |
| sink.transforms.timestampFields | list | `["time","timeReceived","timeCompleted","timestamp"]` | Field names to consider for converting to timestamp |
| sink.primaryKeys.mode | string | `"record_value"` | where to read the primary keys from when creating the table |
| sink.primaryKeys.fields | list | `["time","userId","projectId"]` | fields to include as primary keys when creating the table |
| sink.topics | string | `"android_phone_relative_location, android_phone_battery_level, connect_upload_altoida_summary, connect_fitbit_intraday_heart_rate, connect_fitbit_intraday_steps"` | Comma-separated list of topics the connector will read from and ingest into the database |
| sink.tableNameFormat | string | `"${topic}"` | How to format a table name based on the inserted topic |
| jdbc.url | string | `nil` | Host of the TimescaleDB database |
| jdbc.urlSecret | object | `{"key":null,"name":null}` | Kubernetes secret name for the JDBC connection URL (disables the use of 'url' value) |
| jdbc.user | string | `nil` | TimescaleDB database username |
| jdbc.userSecret | object | `{"key":null,"name":null}` | Kubernetes secret name for the username (disables the use of 'user' value) |
| jdbc.password | string | `nil` | TimescaleDB database password (using a secret is recommended) |
| jdbc.passwordSecret | object | `{"key":null,"name":null}` | Kubernetes secret name for the password |
| jdbc.dialect | string | `"TimescaleDBDatabaseDialect"` | JDBC connect dialect that the database uses |
| timescaledb.enabled | bool | `true` | Use the local cloudnativepg timescaledb cluster |
| timescaledb.cluster | object | check `values.yaml` | CloudNativePG TimescaleDB configuration |
