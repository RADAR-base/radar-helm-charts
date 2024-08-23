

# radar-backend
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-backend)](https://artifacthub.io/packages/helm/radar-base/radar-backend)

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.0](https://img.shields.io/badge/AppVersion-0.4.0-informational?style=flat-square)

A Helm chart for RADAR-Base backend services which provides a layer to monitor and analyze streams of wearable data and write data to  storage.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-backend>
* <https://github.com/RADAR-base/RADAR-Appserver>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` |  |
| image.repository | string | `"radarbase/radar-backend"` |  |
| image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-backend.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-backend.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-backend pods' Security Context |
| securityContext | object | `{}` | Configure radar-backend containers' Security Context |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| extraEnv[0].name | string | `"TOPIC_LIST"` |  |
| extraEnv[0].value | string | `"application_record_counts"` |  |
| zookeeper | string | `"cp-zookeeper-headless:2181"` |  |
| kafka | string | `"cp-kafka-headless:9092"` |  |
| rest_proxy | string | `"http://cp-kafka-rest:8082"` |  |
| schema_registry | string | `"http://cp-schema-registry:8081"` |  |
| kafka_num_brokers | string | `"3"` |  |
| smtp.host | string | `"smtp"` |  |
| smtp.port | int | `25` |  |
| smtp.user | string | `"user@example.com"` |  |
| persistence.enabled | bool | `false` |  |
