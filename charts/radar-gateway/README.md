

# radar-gateway
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-gateway)](https://artifacthub.io/packages/helm/radar-base/radar-gateway)

![Version: 1.0.4](https://img.shields.io/badge/Version-1.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.0](https://img.shields.io/badge/AppVersion-0.6.0-informational?style=flat-square)

A Helm chart for RADAR-base gateway. REST Gateway to Kafka, for incoming participant data. It performs authentication, authorization, content validation and decompression. For more details of the configurations, see https://github.com/RADAR-base/RADAR-Gateway/blob/master/gateway.yml.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-gateway>
* <https://github.com/RADAR-base/RADAR-Gateway>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-gateway replicas to deploy |
| image.repository | string | `"radarbase/radar-gateway"` | radar-gateway image repository |
| image.tag | string | `"0.6.0"` | radar-gateway image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-gateway image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-gateway.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-gateway.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-gateway pods' Security Context |
| securityContext | object | `{}` | Configure radar-gateway containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-gateway port |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and deny access to sensitive URLs |
| ingress.path | string | `"/kafka/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls-radar-gateway"` | Name of the secret that contains TLS certificates |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `10` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `10` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| serviceMonitor.enabled | bool | `true` | Enable metrics to be collected via Prometheus-operator |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the management portal application |
| schemaRegistry | string | `"http://cp-schema-registry:8081"` | Schema Registry URL |
| max_requests | int | `1000` | Not used. To be confirmed |
| bootstrapServers | string | `"cp-kafka-headless:9092"` | Kafka broker URLs |
| checkSourceId | bool | `true` | set to true, if sources in access token should be validated |
| adminProperties | object | `{}` | Additional Kafka Admin Client settings as key value pairs. Read from https://kafka.apache.org/documentation/#adminclientconfigs. |
| producerProperties | object | `{"compression.type":"lz4"}` | Kafka producer properties as key value pairs. Read from https://kafka.apache.org/documentation/#producerconfigs. |
| serializationProperties | object | `{}` | Additional Kafka serialization settings, used in KafkaAvroSerializer. Read from [io.confluent.kafka.serializers.AbstractKafkaSchemaSerDeConfig]. |
| serverProperties | object | `{"maxRequestSize":25165824}` | Additional gateway server properties |
| serverProperties.maxRequestSize | int | `25165824` | Maximum request size, also after decompression. |
| cc.enabled | bool | `false` | set to true, if requests should be forwarded to Confluent Cloud based brokers. |
| cc.apiKey | string | `"ccApikey"` | Confluent Cloud cluster API key |
| cc.apiSecret | string | `"ccApiSecret"` | Confluent Cloud cluster API secret |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | Confluent Cloud schema registry API key |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | Confluent Cloud schema registry API secret |
