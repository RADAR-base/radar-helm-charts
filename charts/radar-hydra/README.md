

# kratos
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/kratos)](https://artifacthub.io/packages/helm/radar-base/kratos)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

A ORY Hydra Helm chart for RADAR-base. ORY Hydra is a cloud native Identity and User Management system.

## Ory Hydra

This chart deploys Ory Hydra that via a dependency to this chart. Configuration to the Ory Hydra chart is passed via the `hydra:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/ory/hydra) of the Ory Hydra chart for more information on how to configure this service.

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://k8s.ory.sh/helm/charts | hydra | 0.48.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hydra | object | check `values.yaml` | Ory Hydra configuration |
