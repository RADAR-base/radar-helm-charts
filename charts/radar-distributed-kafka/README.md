

# radar-distributed-kafka
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-distributed-kafka)](https://artifacthub.io/packages/helm/radar-base/radar-distributed-kafka)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.8.5](https://img.shields.io/badge/AppVersion-7.8.5-informational?style=flat-square)

A Helm chart for running distributed Kafka source connectors with per-source configuration blocks.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-distributed-kafka>

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
| replicaCount | int | `1` | Number of replicas per connector deployment |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"confluentinc/cp-server-connect"` | Image repository Default uses Confluent's Kafka Connect image. For production, use a custom image that already contains the connector plugins you enable in `connectors`. |
| image.tag | string | `"7.8.0"` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. |
| nameOverride | string | `""` | String to partially override radar-distributed-kafka.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-distributed-kafka.fullname template with a string |
| podSecurityContext | object | `{}` | Configure connector pods' Security Context |
| kafkaHeapOpts | string | `"-Xms1g -Xmx2g"` | JVM options for Kafka Connect |
| securityContext | object | `{}` | Configure connector containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8083` | Connector REST API port |
| resources.requests | object | `{"cpu":"100m","memory":"1Gi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Additional environment variables to pass to all connectors |
| pluginInstallation.enabled | bool | `true` | Install connector plugins at startup using an init container. |
| pluginInstallation.pluginPath | string | `"/opt/connect-plugins"` | Directory where plugins are installed and then mounted into the Kafka Connect container. |
| pluginInstallation.confluentHubPackages | list | `["confluentinc/kafka-connect-s3:latest","confluentinc/kafka-connect-s3-source:latest"]` | Confluent Hub package coordinates to install (for example `confluentinc/kafka-connect-s3-source:latest`). |
| pluginInstallation.initContainerImage | object | `{}` | Optional image override for the plugin installer init container. By default the chart uses the same image as `image`. |
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
| kafka_num_brokers | int | `3` | Number of deployed Kafka broker instances |
| kafka.url | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | Kafka broker URLs |
| kafka.security | object | `{"env":[{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"},{"name":"CONNECT_PRODUCER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_PRODUCER_SASL_MECHANISM","value":"SCRAM-SHA-512"},{"name":"CONNECT_CONSUMER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_CONSUMER_SASL_MECHANISM","value":"SCRAM-SHA-512"}],"jaasSecret":{"key":"sasl.jaas.config","name":"shared-service-user"}}` | Security related env vars set in pods. |
| kafka.security.env | list | `[{"name":"CONNECT_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_SASL_MECHANISM","value":"SCRAM-SHA-512"},{"name":"CONNECT_PRODUCER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_PRODUCER_SASL_MECHANISM","value":"SCRAM-SHA-512"},{"name":"CONNECT_CONSUMER_SECURITY_PROTOCOL","value":"SASL_PLAINTEXT"},{"name":"CONNECT_CONSUMER_SASL_MECHANISM","value":"SCRAM-SHA-512"}]` | Env vars set for authentication with Kafka brokers. |
| kafka.security.jaasSecret | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| schemaRegistry.url | string | `"http://radar-kafka-schema-registry:8081"` | Schema registry URL |
| commonConnectorProperties | object | {} | Additional properties injected into all connector property files |
| connectorRegistration.enabled | bool | `true` | Automatically register/update connector config at pod startup |
| connectorRegistration.maxWaitSeconds | int | `120` | Maximum time in seconds to wait for Connect REST API before failing startup |
| connectorRegistration.retryIntervalSeconds | int | `3` | Interval in seconds between readiness checks for Connect REST API |
| connectors | list | Check values.yaml | List of source connector definitions. Each enabled entry is deployed as a separate Kafka Connect worker. |
| connectors[0].enabled | bool | `true` | Whether this connector entry should be deployed |
| connectors[0].type | string | `"s3-source"` | Source connector type. Currently only `s3` is supported. |
| connectors[0].topic | string | `"connect_s3_default"` | Kafka topic where this source writes records. |
| connectors[0].maxTasks | int | `1` | Number of tasks for this connector |
| connectors[0].connectorClass | string | `"io.confluent.connect.s3.source.S3SourceConnector"` | Extra connector properties specific to this connector entry |
| networkpolicy | object | `{"egress":[{"to":[{"ipBlock":{"cidr":"0.0.0.0/0","except":["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12"]}}]},{"ports":[{"port":53,"protocol":"UDP"},{"port":53,"protocol":"TCP"}],"to":[{"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"{{ .Release.Namespace }}"}},"podSelector":{"matchLabels":{"app.kubernetes.io/name":"radar-kafka-kafka-bootstrap"}}},{"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"{{ .Release.Namespace }}"}},"podSelector":{"matchLabels":{"app.kubernetes.io/name":"radar-kafka-schema-registry"}}},{"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}},"podSelector":{"matchLabels":{"k8s-app":"kube-dns"}}}]}],"policyTypes":["Egress"]}` | Network policy defines who can access this application and who this application has access to |
