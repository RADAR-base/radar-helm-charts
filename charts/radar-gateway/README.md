

# radar-gateway
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-gateway)](https://artifacthub.io/packages/helm/radar-base/radar-gateway)

![Version: 1.3.0](https://img.shields.io/badge/Version-1.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.7.7](https://img.shields.io/badge/AppVersion-0.7.7-informational?style=flat-square)

A Helm chart for RADAR-base gateway. REST Gateway to Kafka, for incoming participant data. It performs authentication, authorization, content validation and decompression. For more details of the configurations, see https://github.com/RADAR-base/RADAR-Gateway/blob/master/gateway.yml.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-gateway>
* <https://github.com/RADAR-base/RADAR-Gateway>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-gateway replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-gateway"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName |
| nameOverride | string | `""` | String to partially override radar-gateway.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-gateway.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-gateway pods' Security Context |
| securityContext | object | `{}` | Configure radar-gateway containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-gateway port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and deny access to sensitive URLs |
| ingress.path | string | `"/kafka/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | Name of the secret that contains TLS certificates |
| resources.requests | object | `{"cpu":"100m","memory":"400Mi"}` | CPU/Memory resource requests |
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
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| serviceMonitor.enabled | bool | `true` | Enable metrics to be collected via Prometheus-operator |
| hpa.enabled | bool | `true` | Enable HPA |
| hpa.maxReplicas | string | `"5"` | Maximum number of replicas |
| hpa.targetCPU | string | `"80"` | Target CPU utilization percentage |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the management portal application |
| schemaRegistry | string | `"http://cp-schema-registry:8081"` | Schema Registry URL |
| max_requests | int | `1000` | Not used. To be confirmed |
| bootstrapServers | string | `"cp-kafka-headless:9092"` | Kafka broker URLs |
| checkSourceId | bool | `true` | set to true, if sources in access token should be validated |
| adminProperties | object | `{}` | Additional Kafka Admin Client settings as key value pairs. Read from https://kafka.apache.org/documentation/#adminclientconfigs. |
| producerProperties | object | `{"compression.type":"lz4"}` | Kafka producer properties as key value pairs. Read from https://kafka.apache.org/documentation/#producerconfigs. |
| serializationProperties | object | `{}` | Additional Kafka serialization settings, used in KafkaAvroSerializer. Read from [io.confluent.kafka.serializers.AbstractKafkaSchemaSerDeConfig]. |
| serverProperties | object | `{"maxRequestSize":25165824,"requestTimeout":30}` | Additional gateway server properties |
| serverProperties.maxRequestSize | int | `25165824` | Maximum request size, also after decompression. |
| serverProperties.requestTimeout | int | `30` | Maximum response time in seconds. |
| cc.enabled | bool | `false` | set to true, if requests should be forwarded to Confluent Cloud based brokers. |
| cc.apiKey | string | `"ccApikey"` | Confluent Cloud cluster API key |
| cc.apiSecret | string | `"ccApiSecret"` | Confluent Cloud cluster API secret |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | Confluent Cloud schema registry API key |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | Confluent Cloud schema registry API secret |
| public_key_endpoints_enabled | bool | `false` | Enables config of public key endpoints for token verification This config option is implemented to fix a compatibility issue with radar-gateway. It can be removed when the publicKeyUrls config option is merged to master. |
| public_key_endpoints | list | `[]` | List of public key endpoints for token verification |
| serverName | string | `"localhost"` | Resolvable server name, needed to find the advertised URL and callback URL |
| sentry.dsn | string | `nil` | DSN (Data Source Name) of the sentry server |
| sentry.level | string | `"ERROR"` | Log level for sentry (TRACE, DEBUG, INFO, WARN, or ERROR) |
| sentry.service.name | string | `nil` | Name of the service to be displayed in the sentry dashboard |
| sentry.service.release | string | `nil` | App version to be displayed in the sentry dashboard |
| sentry.service.environment | string | `"production"` | Environment of the sentry service |
| sentry.stacktrace.enabled | bool | `true` | Set to true, if stack trace should be enabled |
| sentry.stacktrace.packages | string | `"org.radarbase.gateway,org.apache.avro"` | Comma-separated list of package prefixes to be included in the stacktrace |
