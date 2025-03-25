

# radar-cloudnative-postgresql
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-cloudnative-postgresql)](https://artifacthub.io/packages/helm/radar-base/radar-cloudnative-postgresql)

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square)

CloudNativePG postgresql helm chart for RADAR-base

## CloudNativePG Operator

This chart uses CloudNativePG Operator to deploy a PostgreSQL database. The deployment of this operator is managed by the
`cloudnativepg-operator` chart dependency. Configuration to the operator is passed via the `cluster:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/cloudnative-pg/cloudnative-pg) of the CloudNativePG Operator
for more information on how to configure the operator.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://cloudnative-pg.github.io/charts | cluster | 0.2.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| secrets | list | `[{"dbname":"managementportal","user":"managementportal"},{"dbname":"restsourceauthorizer","user":"restsourceauthorizer"},{"dbname":"appconfig","user":"appconfig"},{"dbname":"kratos","user":"kratos"},{"dbname":"hydra","user":"hydra"},{"dbname":"appserver","user":"appserver"},{"dbname":"uploadconnector","user":"uploadconnector"}]` | Random database password secrets will be created for these users. |
| cluster | object | check `values.yaml` | CloudNativePG configuration |
