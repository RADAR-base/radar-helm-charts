

# radar-kafka
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-kafka)](https://artifacthub.io/packages/helm/radar-base/radar-kafka)

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![AppVersion: 3.9.0](https://img.shields.io/badge/AppVersion-3.9.0-informational?style=flat-square)

Apache Kafka for RADAR-base using the Strimzi Operator

**Homepage:** <https://radar-base.org>

# Kafka and Schema registry operators

This chart deploys a Kafka cluster through the Strimzi Kafka operator that is a dependency to this chart. Configuration for the Strimzi operator chart is passed via the `strimzi-kafka-operator` key in the `values.yaml` file.
Consult the [documentation](https://strimzi.io/documentation/) of the Strimzi Kafka operator for more information on how to configure this service.

In addition, this chart deploys a Confluent Schema Registry connected to the Kafka cluster through the Strimzi Registry operator that is a dependency to this chart. Configuration for this chart is passed via the `strimzi-registry-operator` key in the `values.yaml` file.
Consult the [documentation](https://github.com/lsst-sqre/strimzi-registry-operator) of the Stimzi Registry operator for more information on how to configure this service.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/strimzi-kafka-operator | strimzi-kafka-operator | 0.46.0 |
| file://../../external/strimzi-registry-operator | strimzi-registry-operator | 2.1.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| server_name | string | `"localhost"` | domain name of the server |
| disable_tls | bool | `false` |  |
| dev_deployment | bool | `false` | Deploy with minimal replicas, replicationFactor and without PVCs (a.k.a ephemeral mode) |
| nameOverride | string | `""` | String to partially override radar-kafka.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-kafka.fullname template with a string |
| metrics | object | `{"enabled":true,"kafkaExporter":{"enableSaramaLogging":true,"groupRegex":".*","topicRegex":".*"}}` | Enable metrics to be collected via Prometheus-operator |
| metrics.enabled | bool | `true` | Enable monitoring of metrics |
| metrics.kafkaExporter | object | `{"enableSaramaLogging":true,"groupRegex":".*","topicRegex":".*"}` | Values for Prometheus JMX Exporter attached to Kafka pods ref: https://strimzi.io/docs/operators/latest/deploying#proc-metrics-kafka-deploy-options-str |
| strimzi-kafka-operator | object | check `values.yaml` | Values for kafka operator ref: https://strimzi.io/docs/operators/latest/deploying#assembly-operators-str |
| strimzi-registry-operator | object | `{"clusterName":"radar","operatorNamespace":"default"}` | Values for schema registry operator ref: https://github.com/lsst-sqre/strimzi-registry-operator |
| strimzi-registry-operator.clusterName | string | `"radar"` | Keep in sync with 'fullnameOverride' |
| strimzi-registry-operator.operatorNamespace | string | `"default"` | Keep in sync with namespace used by deployment |
| kafka | object | `{"insyncReplicas":2,"metadataVersion":"3.9-IV0","partitions":9,"podSecurityContext":{},"replicas":3,"replicationFactor":3,"securityContext":{},"storage":{"size":"10Gi"}}` | Values for strimzi-registry-operator ref: https://strimzi.io/docs/operators/latest/deploying#proc-registry-deploy-options-str |
| kafka.replicas | int | `3` | Number of Kafka brokers |
| kafka.replicationFactor | int | `3` | Number of replicas for Kafka topics |
| kafka.insyncReplicas | int | `2` | Number of in-sync kafka broker replicas |
| kafka.partitions | int | `9` | Number of topic data partitions. Rule of thumb: 3 times the number of brokers. Headroom is used for future upscale of brokers. ref: https://learn.conduktor.io/kafka/kafka-topics-choosing-the-replication-factor-and-partitions-count/ |
| kafka.metadataVersion | string | `"3.9-IV0"` | Metadata API version. Keep in sync with appVersion |
| kafka.storage | object | `{"size":"10Gi"}` | Storage size for Kafka pods |
| kafka.podSecurityContext | object | `{}` | Security Context for Kafka pods ref: https://strimzi.io/docs/operators/latest/deploying#assembly-security-providers-str |
| kafka.securityContext | object | `{}` | Security Context for Kafka containers ref: https://strimzi.io/docs/operators/latest/deploying#assembly-security-providers-str |
| schema-registry | object | check `values.yaml` | Values for schema registry deployed by strimzi-registry-operator ref: https://github.com/lsst-sqre/strimzi-registry-operator |
