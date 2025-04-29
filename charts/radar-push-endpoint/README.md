

# radar-push-endpoint
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-push-endpoint)](https://artifacthub.io/packages/helm/radar-base/radar-push-endpoint)

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.3.2](https://img.shields.io/badge/AppVersion-0.3.2-informational?style=flat-square)

A Helm chart for RADAR-base Push Endpoint. REST Gateway to Kafka, for incoming data from Push or Subscription based WEB APIs. It performs authentication, authorization and content validation. For more details of the configurations, see https://github.com/RADAR-base/RADAR-PushEndpoint.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-push-endpoint>
* <https://github.com/RADAR-base/RADAR-PushEndpoint>

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
| replicaCount | int | `2` | Number of radar-push-endpoint replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-push-endpoint"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| image_exporter.registry | string | `"docker.io"` | Image registry |
| image_exporter.repository | string | `"sscaling/jmx-prometheus-exporter"` | Image repository |
| image_exporter.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image_exporter.digest | string | `"sha256:48e3bd31f132146751e449429a3e8a260b141f2acd587878fc50b3eda4466c5d"` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image_exporter.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image_exporter.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-push-endpoint.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-push-endpoint.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-push-endpoint pods' Security Context |
| securityContext | object | `{}` | Configure radar-push-endpoint containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8090` | radar-push-endpoint port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and deny access to sensitive URLs |
| ingress.path | string | `"/push-endpoint"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | Name of the secret that contains TLS certificates |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `20` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `90` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `20` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `90` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| serviceMonitor.enabled | bool | `true` | Enable metrics to be collected via Prometheus-operator |
| hpa.enabled | bool | `false` | Enable HPA |
| hpa.maxReplicas | string | `"5"` | Maximum number of replicas |
| hpa.targetCPU | string | `"80"` | Target CPU utilization percentage |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| schemaRegistry | string | `"http://cp-schema-registry:8081"` | Schema Registry URL |
| max_requests | int | `1000` | Not used. To be confirmed |
| bootstrapServers | string | `"cp-kafka-headless:9092"` | Kafka broker URLs |
| checkSourceId | bool | `true` | set to true, if sources in access token should be validated |
| adminProperties | object | `{}` | Additional Kafka Admin Client settings as key value pairs. Read from https://kafka.apache.org/documentation/#adminclientconfigs. |
| producerProperties | object | `{"compression.type":"lz4"}` | Kafka producer properties as key value pairs. Read from https://kafka.apache.org/documentation/#producerconfigs. |
| serializationProperties | object | `{}` | Additional Kafka serialization settings, used in KafkaAvroSerializer. Read from [io.confluent.kafka.serializers.AbstractKafkaSchemaSetDeConfig]. |
| cc.enabled | bool | `false` | set to true, if requests should be forwarded to Confluent Cloud based brokers. |
| cc.apiKey | string | `"ccApikey"` | Confluent Cloud cluster API key |
| cc.apiSecret | string | `"ccApiSecret"` | Confluent Cloud cluster API secret |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | Confluent Cloud schema registry API key |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | Confluent Cloud schema registry API secret |
| garmin.enabled | bool | `true` | Whether to enable Garmin endpoints |
| garmin.consumerKey | string | `"consumerKey"` | Consumer key for you application in Garmin Health API developer portal |
| garmin.consumerSecret | string | `"consumerSecret"` | Consumer secret for you application in Garmin Health API developer portal |
| garmin.userRepositoryClass | string | `"org.radarbase.push.integration.garmin.user.GarminServiceUserRepository"` | The user repository to use for getting list of users and their authorization information |
| garmin.userRepositoryUrl | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend"` | The base url of the user repository if the repository is http(s) based. |
| garmin.userRepositoryClientId | string | `"radar_push_endpoint"` | The client ID to access the user repository if the repository requires authorization |
| garmin.userRepositoryClientSecret | string | `"secret"` | The client secret to access the user repository if the repository requires authorization |
| garmin.userRepositoryTokenUrl | string | `"http://management-portal:8080/managementportal/oauth/token"` | The token URL for authentication (Usually the management portal token url). Make sure to avoid trailing slash (/) in the url. |
| garmin.backfill.enabled | bool | `true` | Whether to enable Garmin backfill requests |
| redis.url | string | `"redis://localhost:6379"` | The redis server URL. Redis is used to keep track of garmin backfill progress and any other key value properties. |
