

# radar-grafana
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-grafana)](https://artifacthub.io/packages/helm/radar-base/radar-grafana)

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 11.2.2-security-01](https://img.shields.io/badge/AppVersion-11.2.2--security--01-informational?style=flat-square)

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
* When `gatewayAPI.enabled=true`: the Gateway API CRDs and a Gateway Controller (e.g. NGINX Gateway Fabric) must already be installed in the cluster, and the shared parent Gateway `radar-base-k8s-gateway` must exist — it can be created via the [gateway-api](https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/gateway-api) chart

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
| gatewayAPI.enabled | bool | `false` | Enable Gateway API HTTPRoute resource (alternative to grafana.ingress). Opt-in: requires the Gateway API CRDs and a Gateway controller to be installed. |
| gatewayAPI.annotations | object | `{}` | Annotations to add to the HTTPRoute |
| gatewayAPI.parentRef | object | `{"name":"radar-base-k8s-gateway","namespace":""}` | Parent Gateway that the HTTPRoute attaches to. The Gateway itself is a shared resource and must be created separately (not by this chart). |
| gatewayAPI.parentRef.name | string | `"radar-base-k8s-gateway"` | Name of the Gateway |
| gatewayAPI.parentRef.namespace | string | `""` | Namespace of the Gateway (defaults to the release namespace when empty) |
| gatewayAPI.hostnames | list | `["dashboard.{{ .Values.grafana.server_name }}"]` | Hostnames the HTTPRoutes accept requests for (must intersect the Gateway listener hostnames). String values support Helm templating (tpl); defaults to dashboard.<grafana.server_name> so deployments override it the same way as grafana.ingress.hosts. |
| gatewayAPI.https | object | `{"port":443,"sectionName":""}` | HTTPS listener on the Gateway that the main route attaches to |
| gatewayAPI.https.port | int | `443` | Listener port (empty attaches to all matching listeners) |
| gatewayAPI.https.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.pathType | string | `"PathPrefix"` | Path match type (PathPrefix, Exact or RegularExpression) |
| gatewayAPI.path | string | `"/"` | Path to match within the URL structure |
| gatewayAPI.filters | list | `[]` | Additional HTTPRoute filters (e.g. URLRewrite, RequestHeaderModifier) |
| gatewayAPI.httpsRedirect | object | `{"enabled":true,"port":80,"sectionName":"","statusCode":301}` | HTTP->HTTPS redirect route (equivalent to nginx force-TLS behaviour) |
| gatewayAPI.httpsRedirect.enabled | bool | `true` | Enable a second HTTPRoute that 301-redirects HTTP traffic to HTTPS |
| gatewayAPI.httpsRedirect.port | int | `80` | HTTP listener port on the Gateway to attach the redirect to |
| gatewayAPI.httpsRedirect.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.httpsRedirect.statusCode | int | `301` | Redirect HTTP status code |
| podDisruptionBudget.enabled | bool | `false` | Enable Pod Disruption Budget |
| podDisruptionBudget.minAvailable | int | `1` | Minimum number of pods that must be available during disruptions |
| podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of pods that can be unavailable during disruptions |
