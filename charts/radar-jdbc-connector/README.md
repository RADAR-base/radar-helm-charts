

# radar-jdbc-connector

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.5.2](https://img.shields.io/badge/AppVersion-10.5.2-informational?style=flat-square)

A Helm chart for RADAR-base JDBC Kafka connector. This is a fork of the Kafka JDBC connector which allows data from topics to be imported into JDBC databases (including TimescaleDB databases which is used in the dashboard pipeline).

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/RADAR-JDBC-Connector>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of radar-jdbc-connector replicas to deploy |
| image.repository | string | `"radarbase/radar-jdbc-connector"` | radar-jdbc-connector image repository |
| image.tag | string | `"10.5.2"` | radar-jdbc-connector image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-jdbc-connector image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
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
| kafka | string | `"PLAINTEXT://cp-kafka-headless:9092"` | URI of Kafka brokers of the cluster |
| kafka_num_brokers | string | `"3"` | Number of Kafka brokers. This is used to validate the cluster availability at connector init. |
| schema_registry | string | `"http://cp-schema-registry:8081"` | URL of the Kafka schema registry |
| maxTasks | int | `2` | Maximum number of worker threads inside a connector pod. |
| mode | string | `"sink"` | Either source or sink |
| source.name | string | `"radar-jdbc-source"` | Name of the connector Kafka producer group |
| source.tableWhitelist | string | `""` | Comma-separted list of tables to read |
| source.topicPrefix | string | `""` | Prefix to prepend to table names to generate the name of the Kafka topic to publish data to. |
| source.mode | string | `"incrementing"` | How to detect new values in a table. |
| source.incrementingColumnName | string | `""` | When using mode incrementing, which column to use as incrementing. If empty, autodetection will be used. |
| sink.name | string | `"radar-jdbc-sink"` | Name of the connector Kafka consumer group |
| sink.autoCreate | bool | `true` | create table if it does not exist |
| sink.insertMode | string | `"upsert"` | How to insert new values into the database |
| sink.primaryKeys.mode | string | `"record_value"` |  |
| sink.primaryKeys.fields | list | `["time","userId","projectId"]` | fields to include as primary keys when creating the table |
| sink.topics | string | `"android_phone_relative_location, android_phone_battery_level, connect_upload_altoida_summary, connect_fitbit_intraday_heart_rate, connect_fitbit_intraday_steps"` | Comma-separated list of topics the connector will read from and ingest into the database |
| sink.tableNameFormat | string | `"${topic}"` | How to format a table name based on the inserted topic |
| environment | object | `{"CONNECT_SECURITY_PROTOCOL":"PLAINTEXT"}` | Additional environment variables to pass to the connector. These can be used to pass supported kafka and connect specifc [configs](https://docs.confluent.io/platform/current/installation/docker/config-reference.html#kconnect-long-configuration) |
| environment.CONNECT_SECURITY_PROTOCOL | string | `"PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| jdbc.url | string | `"jdbc:postgresql://timescaledb-postgresql-headless:5432/grafana-metrics"` | Host of the TimescaleDB database |
| jdbc.user | string | `"grafana"` | TimescaleDB database username |
| jdbc.password | string | `"password"` | TimescaleDB database password |
| jdbc.dialect | string | `"TimescaleDBDatabaseDialect"` | JDBC connect dialect that the database uses |
