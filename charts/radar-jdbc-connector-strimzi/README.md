

# radar-fitbit-connector-strimzi
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-fitbit-connector-strimzi)](https://artifacthub.io/packages/helm/radar-base/radar-fitbit-connector-strimzi)

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.9.0](https://img.shields.io/badge/AppVersion-3.9.0-informational?style=flat-square)

A Helm chart for RADAR-base fitbit Kafka connector using the Strimzi Operator. This application collects data from participants via the Fitbit Web API.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-fitbit-connector-strimzi>
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
| replicaCount | int | `1` | Number of radar-fitbit-connector-strimzi replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/kafka-connect-rest-fitbit-source"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-fitbit-connector-strimzi.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-fitbit-connector-strimzi.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-fitbit-connector-strimzi pods' Security Context |
| securityContext | object | `{}` | Configure radar-fitbit-connector-strimzi containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-fitbit-connector-strimzi port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| jvmOptions.xmx | string | `"768m"` |  |
| jvmOptions.xms | string | `"256m"` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| secret.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| extraEnvVars | list | `[]` | Extra environment variables |
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
| kafka | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | URI of Kafka brokers of the cluster |
| schema_registry | string | `"http://radar-kafka-schema-registry:8081"` | URL of the Kafka schema registry |
| radar_rest_sources_backend_url | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend/"` | Base URL of the rest-sources-authorizer-backend service |
| connector_num_tasks | string | `"5"` | Number of connector tasks to be used in kafka-connector spec properties |
| fitbit_api_url | string | `"https://api.fitbit.com"` | Fitbit API URL. |
| fitbit_api_client | string | `""` | Fitbit API client id. |
| fitbit_api_secret | string | `""` | Fitbit API client secret. |
| oauthClientId | string | `"radar_fitbit_connector"` | OAuth2 client id from Management Portal |
| oauthClientSecret | string | `"secret"` | OAuth2 client secret from Management Portal |
| auth_url | string | `"http://management-portal:8080/managementportal/oauth/token"` | OAuth2 Auth URL for connector client to get access tokens |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of Management Portal. This will be used to create URLs to access Management Portal |
| includeIntradayData | bool | `true` | Set to true, if intraday access data should be collected by the connector. This will be set in connector.properties. |
| user_repository_class | string | `"ServiceUserRepositoryLegacy"` | Class of the user repository to use. This should be a class that implements the UserRepository interface. Use of the YamlUserRepository is deprecated, use ServiceUserRepositoryLegacy instead. |
| rest_source_poll_interval_ms | int | `60000` | How often to poll the source URL. Only use to speed up processing times during e2e testing. |
| fitbit_user_poll_interval | int | `5000` | Polling interval per Fitbit user per request route in seconds. Only use to speed up processing times during e2e testing. |
| application_loop_interval_ms | int | `300000` | How often to perform the main application loop (only controls how often to poll for new user registrations). Only use to speed up processing times during e2e testing. |
| user_cache_refresh_interval_ms | int | `3600000` | How often to invalidate the cache and poll for new user registrations. Only use to speed up processing times during e2e testing. |
| log4j | object | `{"rootLogLevel":"INFO"}` | Log4j configuration |
| log4j.rootLogLevel | string | `"INFO"` | Root log level for the Kafka Connect instance |
| sentry.dsn | string | `nil` | DSN (Data Source Name) of the sentry server |
| sentry.level | string | `"ERROR"` | Log level for sentry (TRACE, DEBUG, INFO, WARN, or ERROR) |
