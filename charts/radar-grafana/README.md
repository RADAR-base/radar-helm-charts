

# radar-grafana
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-grafana)](https://artifacthub.io/packages/helm/radar-base/radar-grafana)

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 11.2.2-security-01](https://img.shields.io/badge/AppVersion-11.2.2--security--01-informational?style=flat-square)

A Helm chart for Grafana dashboard used by RADAR-base

**Homepage:** <https://radar-base.org>

## Grafana

This chart deploys [Grafana](https://grafana.com/) via a dependency to this chart. Configuration to the Grafana chart is passed via the `grafana:` key in the
values.yaml file. Consult the [documentation](https://artifacthub.io/packages/helm/grafana/grafana) of the Grafana chart
for additional information on how to configure this service if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-grafana>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/grafana | grafana | 8.11.3 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafana | object | check 'values.yaml' | Grafana Helm Chart configuration |
| grafana.server_name | string | `"localhost"` | Hostname for the Grafana service |
| grafana.advertised_protocol | string | `"https"` | Protocol for the Grafana service (allowed values: http, https) |
