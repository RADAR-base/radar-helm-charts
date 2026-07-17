

# radar-cloudnative-postgresql
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-cloudnative-postgresql)](https://artifacthub.io/packages/helm/radar-base/radar-cloudnative-postgresql)

![Version: 0.4.1](https://img.shields.io/badge/Version-0.4.1-informational?style=flat-square)

CloudNativePG Postgresql helm chart for RADAR-base

**Homepage:** <https://radar-base.org>

## CloudNativePG Operator

This chart uses [CloudNativePG Operator](https://cloudnative-pg.io/) to deploy a PostgreSQL database. The deployment of this operator is managed by the
`cloudnativepg-operator` chart dependency. Configuration to the operator is passed via the `cluster:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/cloudnative-pg/cloudnative-pg) of the CloudNativePG Operator
for additional information on how to configure the operator if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-cloudnative-postgresql>

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
| secret | object | `{"enabled":true,"nameOverride":"","secretAnnotations":{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation","helm.sh/hook-weight":"0","helm.sh/resource-policy":"keep"},"users":[{"dbname":"managementportal","user":"managementportal"},{"dbname":"restsourceauthorizer","user":"restsourceauthorizer"},{"dbname":"appconfig","user":"appconfig"},{"dbname":"kratos","user":"kratos"},{"dbname":"hydra","user":"hydra"},{"dbname":"appserver","user":"appserver"},{"dbname":"uploadconnector","user":"uploadconnector"}]}` | Values for creating the database user secretsl |
| secret.enabled | bool | `true` | Switch to false to prevent creating user secrets. |
| secret.secretAnnotations | object | `{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation","helm.sh/hook-weight":"0","helm.sh/resource-policy":"keep"}` | Annotations to be added to secret. Annotations are added only when secret is being created. Existing secret will not be modified. |
| secret.users | list | check values.yaml | Random database password secrets will be created for these users. |
| cluster | object | check `values.yaml` | CloudNativePG configuration |
| cluster.cluster.postgresql.parameters.wal_keep_size | string | `"1GB"` | Can be decreased to save disk space. 1GB default was chosen to prevent missing wal files during recovery. |
