

# radar-hydra
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-hydra)](https://artifacthub.io/packages/helm/radar-base/radar-hydra)

![Version: 0.2.2](https://img.shields.io/badge/Version-0.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

A ORY Hydra Helm chart for RADAR-base. ORY Hydra is a cloud native Identity and User Management system.

**Homepage:** <https://radar-base.org>

## ORY Hydra

This chart deploys [ORY Hydra](https://www.ory.sh/hydra/) via a dependency to this chart. Configuration to the ORY Hydra chart is passed via the `hydra:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/ory/hydra) of the Ory Hydra chart for additional information on how to configure this service if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-hydra>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/hydra | hydra | 0.53.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hydra | object | check `values.yaml` | Ory Hydra configuration |
| hydra.server_name | string | `"localhost"` | Hostname for the Kratos service |
| hydra.advertised_protocol | string | `"https"` | Protocol for the Kratos service (allowed values: http, https) |
