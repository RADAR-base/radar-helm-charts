

# radar-huawei-connector
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-huawei-connector)](https://artifacthub.io/packages/helm/radar-base/radar-huawei-connector)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.0](https://img.shields.io/badge/AppVersion-0.8.0-informational?style=flat-square)

A Helm chart for RADAR-base Huawei connector. This application collects data from participants via the Huawei Health Kit REST API.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-huawei-connector>
* <https://github.com/RADAR-base/RADAR-REST-Connector>

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
| replicaCount | int | `1` | Number of radar-huawei-connector replicas to deploy |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-rest-connector/kafka-connect-huawei-source"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-huawei-connector.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-huawei-connector.fullname template with a string |
| podSecurityContext | object | `{"fsGroup":1000}` | Configure radar-huawei-connector pods' Security Context. fsGroup 1000 (the image's appuser) makes the logs volume, which holds the offsets file, writable by the connector. |
| securityContext | object | `{}` | Configure radar-huawei-connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-huawei-connector port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| persistence.enabled | bool | `true` | Enable persistence using PVC |
| persistence.accessMode | string | `"ReadWriteOnce"` | PVC Access Mode for radar-huawei-connector volume |
| persistence.size | string | `"5Gi"` | PVC Storage Request for radar-huawei-connector volume |
| persistence.fsUserOverride | string | `nil` | Overrides the user of the Huawei connector logs, for example, `"1000:1000"`. |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| secret.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| extraEnvVars | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_PRODUCER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"},{"name":"CONNECT_PRODUCER_SASL_MECHANISM","value":"SCRAM-SHA-512"}]` | Extra environment variables |
| extraEnvVars[0] | object | `{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"}` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| extraEnvVars[2] | object | `{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"}` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
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
| zookeeper | string | `nil` | URI of Zookeeper instances of the cluster |
| kafka | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | URI of Kafka brokers of the cluster |
| kafka_num_brokers | string | `"3"` | Number of Kafka brokers. This is used to validate the cluster availability at connector init. |
| schema_registry | string | `"http://radar-kafka-schema-registry:8081"` | URL of the Kafka schema registry |
| kafka_wait.enabled | bool | `true` | Whether to wait before the specified number of brokers are available. |
| kafka_wait.properties | string | `""` | Kafka connection properties file contents during wait. If empty, all environment variables starting with `CONNECT_` will be used. |
| radar_rest_sources_backend_url | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend/"` | Base URL of the rest-sources-authorizer-backend service |
| connector_num_tasks | string | `"4"` | Number of connector tasks to be used in connector.properties |
| huawei_api_client | string | `""` | Huawei Health Kit API client (app) ID. |
| huawei_api_secret | string | `""` | Huawei Health Kit API client (app) secret. Stored in the chart's Secret, unless `existingSecret` is set. |
| huawei_api_url | string | `"https://hihealthbase-dre.things.dbankcloud.cn"` | Base URL of the Huawei Health Kit API, without the /healthkit/<version> path. `https://health-api.cloud.huawei.com` serves the same data. |
| user_poll_interval | int | `1800` | Seconds to wait before polling a user's data type again once all its data has been collected. |
| late_sync_window | string | `"P14D"` | ISO-8601 duration. Devices can sync days late, so a time window without data is only marked as collected once it is older than this. |
| max_history | string | `"P1Y"` | ISO-8601 period. Huawei serves one year of history (the historydata.open.year scope), counted back from when the user authorized access; data before that is not requested. Empty for no limit. |
| heartbeat_topic | string | `"connect_huawei_heartbeat"` | Kafka topic for empty records that store the progress of time windows without data, so a restart does not request them again. Best configured as a compacted topic. |
| heartbeat_topic_init.enabled | bool | `true` | Create `heartbeat_topic` in an init container before the connector starts, if it does not exist yet. Kafka topic auto-creation would make it a regular, uncompacted topic. |
| heartbeat_topic_init.configs | object | `{"cleanup.policy":"compact"}` | Topic configs to create `heartbeat_topic` with. Partition count and replication factor are the broker defaults. |
| heartbeat_topic_init.resources | object | `{"requests":{"cpu":"100m","memory":"256Mi"}}` | CPU/Memory resource requests of the init container |
| oauthClientId | string | `"radar_huawei_connector"` | OAuth2 client id from Management Portal |
| oauthClientSecret | string | `"secret"` | OAuth2 client secret from Management Portal. Stored in the chart's Secret, unless `existingSecret` is set. |
| existingSecret | string | `""` | Existing Secret with the keys `huaweiApiSecret` and `oauthClientSecret`. If set, `huawei_api_secret` and `oauthClientSecret` are ignored. The connector reads them from environment variables, through Kafka Connect's EnvVarConfigProvider, so they are not stored in the properties ConfigMap. |
| auth_url | string | `"http://management-portal:8080/managementportal/oauth/token"` | OAuth2 Auth URL for connector client to get access tokens |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of Management Portal. This will be used to create URLs to access Management Portal |
| user_repository_class | string | `"HuaweiServiceUserRepository"` | Class name of the user repository. This should be the same as the one used in the connector. |
| routes | object | check `values.yaml` | Huawei data types to collect, by connector route key (`huawei.<key>.enabled`). Set `topic` on a route to override its default Kafka topic (`connect_huawei_<key>`). Disabled routes fail for every user against the live Health Kit API. |
