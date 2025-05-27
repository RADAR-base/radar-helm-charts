

# radar-cloudnative-timescaledb
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-cloudnative-timescaledb)](https://artifacthub.io/packages/helm/radar-base/radar-cloudnative-timescaledb)

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square)

CloudNativePG TimescaleDB cluster helm chart for RADAR-base

**Homepage:** <https://radar-base.org>

## CloudNativePG Operator

This chart uses  CloudNativePG Operator](https://cloudnative-pg.io/) to deploy a TimescaleDB database. The deployment of this operator is managed by the
`cloudnativepg-operator` chart dependency. Configuration to the operator is passed via the `cluster:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/cloudnative-pg/cloudnative-pg) of the CloudNativePG Operator
for additional information on how to configure the operator if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-cloudnative-timescaledb>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/cloudnativepg-cluster | cluster | 0.3.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cluster.type | string | `"timescaledb"` |  |
| cluster.version.timescaledb | string | `"2.15"` |  |
| cluster.mode | string | `"standalone"` |  |
| cluster.recovery.method | string | `"import"` |  |
| cluster.recovery.import.type | string | `"monolith"` |  |
| cluster.recovery.import.databases[0] | string | `"database"` |  |
| cluster.recovery.import.source.host | string | `"timscaledb"` |  |
| cluster.recovery.import.source.username | string | `"postgres"` |  |
| cluster.recovery.import.source.database | string | `"postgres"` |  |
| cluster.recovery.import.source.sslMode | string | `"prefer"` |  |
| cluster.recovery.import.source.passwordSecret.create | bool | `false` |  |
| cluster.recovery.import.source.passwordSecret.name | string | `"postgresql"` |  |
| cluster.recovery.import.source.passwordSecret.key | string | `"postgres-password"` |  |
| cluster.cluster.instances | int | `1` |  |
| cluster.cluster.imagePullPolicy | string | `"Always"` |  |
| cluster.cluster.storage.size | string | `"10Gi"` |  |
| cluster.cluster.monitoring.enabled | bool | `true` |  |
| cluster.cluster.initdb.database | string | `"database"` |  |
| cluster.cluster.initdb.owner | string | `"database"` |  |
