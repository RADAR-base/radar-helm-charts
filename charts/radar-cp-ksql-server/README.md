

# radar-cp-ksql-server
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-cp-ksql-server)](https://artifacthub.io/packages/helm/radar-base/radar-cp-ksql-server)

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![AppVersion: 7.6.0](https://img.shields.io/badge/AppVersion-7.6.0-informational?style=flat-square)

ConfluentInc Ksql Server for RADAR-base

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
| https://radar-base.github.io/cp-helm-charts | ksql(cp-ksql-server) | 0.4.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ksql.kafka.bootstrapServers | string | `"radar-kafka-kafka-brokers:9094"` |  |
| ksql.cp-schema-registry.url | string | `"http://radar-kafka-schema-registry:8081"` |  |
| ksql.secret.jaas.name | string | `"shared-service-user"` |  |
| ksql.secret.jaas.key | string | `"sasl.jaas.config"` |  |
| ksql.configurationOverrides."security.protocol" | string | `"SASL_PLAINTEXT"` |  |
| ksql.configurationOverrides."sasl.mechanism" | string | `"SCRAM-SHA-512"` |  |
| ksql.configurationOverrides."ksql.server.url" | string | `"http://0.0.0.0:8088"` |  |
| ksql.configurationOverrides."ksql.advertised.listener" | string | `"http://ksql-server:8088"` |  |
| ksql.configurationOverrides."ksql.logging.processing.topic.auto.create" | bool | `true` |  |
| ksql.configurationOverrides."ksql.logging.processing.stream.auto.create" | bool | `true` |  |
| ksql.configurationOverrides."ksql.service.id" | string | `"radar_default_"` |  |
| ksql.configurationOverrides."ksql.persistence.default.format.key" | string | `"AVRO"` |  |
| ksql.configurationOverrides."ksql.persistence.default.format.value" | string | `"AVRO"` |  |
| ksql.configurationOverrides."log4j.logger.processing" | bool | `false` |  |
