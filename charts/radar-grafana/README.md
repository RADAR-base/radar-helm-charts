

# radar-grafana
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-grafana)](https://artifacthub.io/packages/helm/radar-base/radar-grafana)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 11.2.2-security-01](https://img.shields.io/badge/AppVersion-11.2.2--security--01-informational?style=flat-square)

A Helm chart for Graphana dashboard used by RADAR-base

**Homepage:** <https://radar-base.org>

## Grafana

This chart uses the Grafana helm chart. Configuration to the Grafana chart is passed via the `grafana:` key in the
values.yaml file. Consult the [documentation](https://artifacthub.io/packages/helm/grafana/grafana) of the Grafana chart
for more information on how to configure this service.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | grafana | 8.3.7 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafana | object | check 'values.yaml' | Grafana Helm Chart configuration |
| grafana.global.imageRegistry | string | `nil` | Overrides the Docker registry globally for all images |
| grafana.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.image.repository | string | `"grafana/grafana"` | Docker image repository |
| grafana.testFramework.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.downloadDashboardsImage.registry | string | `"docker.io"` | The Docker registry |
| grafana.initChownData.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.sidecar.image.registry | string | `"quay.io"` | The Docker registry |
| grafana.imageRenderer.image.registry | string | `"docker.io"` | The Docker registry |
