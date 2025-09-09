

# radar-gateway
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-gateway)](https://artifacthub.io/packages/helm/radar-base/radar-gateway)

![Version: 1.7.1](https://img.shields.io/badge/Version-1.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.9.2](https://img.shields.io/badge/AppVersion-0.9.2-informational?style=flat-square)

A Helm chart for RADAR-base gateway. REST Gateway to Kafka, for incoming participant data. It performs authentication, authorization, content validation and decompression. For more details of the configurations, see https://github.com/RADAR-base/RADAR-Gateway/blob/master/gateway.yml.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

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
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-gateway/radar-gateway"` | Image repository |
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
| javaOpts | string | `"-XX:GCTimeRatio=19 -XX:MinHeapFreeRatio=20 -XX:MaxHeapFreeRatio=30 --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.management/javax.management.openmbean=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.management/javax.management=ALL-UNNAMED -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager"` | Standard JAVA_OPTS that should be passed to this service |
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
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| serviceMonitor.enabled | bool | `true` | Enable metrics to be collected via Prometheus-operator |
| hpa.enabled | bool | `true` | Enable HPA |
| hpa.maxReplicas | string | `"5"` | Maximum number of replicas |
| hpa.targetCPU | string | `"80"` | Target CPU utilization percentage |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the management portal application |
| schemaRegistry | string | `"http://radar-kafka-schema-registry:8081"` | Schema Registry URL |
| max_requests | int | `1000` | Not used. To be confirmed |
| bootstrapServers | string | `"radar-kafka-kafka-bootstrap:9094"` | Kafka broker URLs |
| checkSourceId | bool | `true` | set to true, if sources in access token should be validated |
| adminProperties | object | `{"sasl.mechanism":"SCRAM-SHA-512","security.protocol":"SASL_PLAINTEXT"}` | Additional Kafka Admin Client settings as key value pairs. Read from https://kafka.apache.org/documentation/#adminclientconfigs. |
| adminProperties."security.protocol" | string | `"SASL_PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| adminProperties."sasl.mechanism" | string | `"SCRAM-SHA-512"` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
| producerProperties | object | `{"compression.type":"lz4","sasl.mechanism":"SCRAM-SHA-512","security.protocol":"SASL_PLAINTEXT"}` | Kafka producer properties as key value pairs. Read from https://kafka.apache.org/documentation/#producerconfigs. |
| producerProperties."security.protocol" | string | `"SASL_PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| producerProperties."sasl.mechanism" | string | `"SCRAM-SHA-512"` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
| serializationProperties | object | `{}` | Additional Kafka serialization settings, used in KafkaAvroSerializer. Read from [io.confluent.kafka.serializers.AbstractKafkaSchemaSetDeConfig]. |
| secret.admin.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| secret.producer.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
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
| openTelemetry.agent.enabled | bool | `false` | Enable OpenTelemetry agent (currently only Sentry agent is supported) |
| openTelemetry.agent.agentJar | string | `"sentry-opentelemetry-agent-8.1.0.jar"` | OpenTelemetry Sentry agent jar file name, depends on version of 'io.sentry:sentry-opentelemetry-agent' |
| openTelemetry.exporter.tracesSampleRate | float | `1` | Sample rate for traces (0.0 to 1.0) |
| openTelemetry.exporter.metricsExporterEnabled | bool | `false` | Enable OpenTelemetry metrics exporter other than Sentry |
| openTelemetry.exporter.tracesExporterEnabled | bool | `false` | Enable OpenTelemetry traces exporter other than Sentry |
| openTelemetry.exporter.logsExporterEnabled | bool | `true` | Enable OpenTelemetry logs exporter other than Sentry |
