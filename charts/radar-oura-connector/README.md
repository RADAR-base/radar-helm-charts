

# radar-oura-connector
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-oura-connector)](https://artifacthub.io/packages/helm/radar-base/radar-oura-connector)

![Version: 0.2.3](https://img.shields.io/badge/Version-0.2.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.1](https://img.shields.io/badge/AppVersion-0.6.1-informational?style=flat-square)

A Helm chart for RADAR-base oura connector. This application collects data from participants via the Oura Web API.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-oura-connector>
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
| replicaCount | int | `1` | Number of radar-oura-connector replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/kafka-connect-rest-oura-source"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-oura-connector.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-oura-connector.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-oura-connector pods' Security Context |
| securityContext | object | `{}` | Configure radar-oura-connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | radar-oura-connector port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| persistence.enabled | bool | `true` | Enable persistence using PVC |
| persistence.accessMode | string | `"ReadWriteOnce"` | PVC Access Mode for radar-oura-connector volume |
| persistence.size | string | `"5Gi"` | PVC Storage Request for radar-oura-connector volume |
| persistence.fsUserOverride | string | `nil` | Overrides the user of the oura connector logs, for example, `"1000:1000"`. |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"PLAINTEXT"}]` | Extra environment variables |
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
| zookeeper | string | `"cp-zookeeper-headless:2181"` | URI of Zookeeper instances of the cluster |
| kafka | string | `"PLAINTEXT://cp-kafka-headless:9092"` | URI of Kafka brokers of the cluster |
| kafka_num_brokers | string | `"3"` | Number of Kafka brokers. This is used to validate the cluster availability at connector init. |
| schema_registry | string | `"http://cp-schema-registry:8081"` | URL of the Kafka schema registry |
| kafka_wait.enabled | bool | `true` | Whether to wait before the specified number of brokers are available. |
| kafka_wait.properties | string | `""` | Kafka connection properties file contents during wait. If empty, all environment variables starting with `CONNECT_` will be used. |
| radar_rest_sources_backend_url | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend/"` | Base URL of the rest-sources-authorizer-backend service |
| connector_num_tasks | string | `"5"` | Number of connector tasks to be used in connector.properties |
| oura_api_client | string | `""` | Oura API client id. |
| oura_api_secret | string | `""` | Oura API client secret. |
| oauthClientId | string | `"radar_oura_connector"` | OAuth2 client id from Management Portal |
| oauthClientSecret | string | `"secret"` | OAuth2 client secret from Management Portal |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of Management Portal. This will be used to create URLs to access Management Portal |
| includeIntradayData | bool | `true` | Set to true, if intraday access data should be collected by the connector. This will be set in connector.properties. |
