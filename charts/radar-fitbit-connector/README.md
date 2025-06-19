

# radar-fitbit-connector
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-fitbit-connector)](https://artifacthub.io/packages/helm/radar-base/radar-fitbit-connector)

![Version: 0.9.0](https://img.shields.io/badge/Version-0.9.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.2](https://img.shields.io/badge/AppVersion-0.6.2-informational?style=flat-square)

A Helm chart for RADAR-base fitbit connector. This application collects data from participants via the Fitbit Web API.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-fitbit-connector>
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
| replicaCount | int | `1` | Number of radar-fitbit-connector replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/kafka-connect-rest-fitbit-source"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-fitbit-connector.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-fitbit-connector.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-fitbit-connector pods' Security Context |
| securityContext | object | `{}` | Configure radar-fitbit-connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-fitbit-connector port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| heapOptions | string | `"-Xms256m -Xmx768m"` |  |
| persistence.enabled | bool | `true` | Enable persistence using PVC |
| persistence.accessMode | string | `"ReadWriteOnce"` | PVC Access Mode for radar-fitbit-connector volume |
| persistence.size | string | `"5Gi"` | PVC Storage Request for radar-fitbit-connector volume |
| persistence.fsUserOverride | string | `nil` | Overrides the user of the fitbit connector logs, for example, `"1000:1000"`. |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| secret.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| extraEnvVars | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"}]` | Extra environment variables |
| extraEnvVars[0] | object | `{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"}` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| extraEnvVars[1] | object | `{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"}` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
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
| zookeeper | string | `nil` | URI of Zookeeper instances of the cluster. Leave unset on default RADAR-base deployment (uses Kraft). |
| kafka | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | URI of Kafka brokers of the cluster |
| kafka_num_brokers | string | `"3"` | Number of Kafka brokers. This is used to validate the cluster availability at connector init. |
| schema_registry | string | `"http://radar-kafka-schema-registry:8081"` | URL of the Kafka schema registry |
| kafka_wait.enabled | bool | `true` | Whether to wait before the specified number of brokers are available. |
| kafka_wait.properties | string | `""` | Kafka connection properties file contents during wait. If empty, all environment variables starting with `CONNECT_` will be used. |
| radar_rest_sources_backend_url | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend/"` | Base URL of the rest-sources-authorizer-backend service |
| connector_num_tasks | string | `"5"` | Number of connector tasks to be used in connector.properties |
| fitbit_api_url | string | `"https://api.fitbit.com"` | Fitbit API URL. |
| fitbit_api_client | string | `""` | Fitbit API client id. |
| fitbit_api_secret | string | `""` | Fitbit API client secret. |
| oauthClientId | string | `"radar_fitbit_connector"` | OAuth2 client id from Management Portal |
| oauthClientSecret | string | `"secret"` | OAuth2 client secret from Management Portal |
| auth_url | string | `"http://management-portal:8080/managementportal/oauth/token"` | OAuth2 Auth URL for connector client to get access tokens |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of Management Portal. This will be used to create URLs to access Management Portal |
| includeIntradayData | bool | `true` | Set to true, if intraday access data should be collected by the connector. This will be set in connector.properties. |
| user_repository_class | string | `"ServiceUserRepositoryLegacy"` | Class of the user repository to use. This should be a class that implements the UserRepository interface. |
| rest_source_poll_interval_ms | int | `60000` | How often to poll the source URL. Only use to speed up processing times during e2e testing. |
| fitbit_user_poll_interval | int | `5000` | Polling interval per Fitbit user per request route in seconds. Only use to speed up processing times during e2e testing. |
| application_loop_interval_ms | int | `300000` | How often to perform the main application loop (only controls how often to poll for new user registrations). Only use to speed up processing times during e2e testing. |
| user_cache_refresh_interval_ms | int | `3600000` | How often to invalidate the cache and poll for new user registrations. Only use to speed up processing times during e2e testing. |
